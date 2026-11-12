#!/usr/bin/env python3
"""Budget/resume controller for the bundled ImageGen CLI; never calls the API itself.

The ledger records conservative reservations, NOT measured billed spend. Each CLI
job reserves $0.30 including the SDK's at-most-two automatic retries. Reservations
are not refunded, including on timeout or failure. A prior-sample allowance of $5
is included. Fixed settings and bounded prompts are required for this allowance.
"""
import argparse
import fcntl
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

BUDGET_CENTS = 10000
PRIOR_ALLOWANCE_CENTS = 500
JOB_RESERVATION_CENTS = 30
EXPECTED = {'model': 'gpt-image-2', 'n': 1, 'size': '1024x1024',
            'quality': 'medium', 'output_format': 'webp', 'output_compression': 95}
PRICING_SOURCE = 'https://developers.openai.com/api/docs/guides/image-generation#historical-output-costs'


def validate_jobs(jobs):
    seen = set()
    for job in jobs:
        if any(job.get(key) != value for key, value in EXPECTED.items()):
            raise ValueError('Budget allowance requires fixed model, medium 1024-square, n=1 and WebP settings.')
        if not job.get('prompt', '').isascii() or not 1 <= len(job['prompt']) <= 4096:
            raise ValueError('Prompts must be ASCII and at most 4096 characters.')
        name = job['out']
        if Path(name).name != name or not name.endswith('_v2.webp') or name in seen:
            raise ValueError('Output names must be unique versioned WebP filenames.')
        if set(job) - {'id', 'group', 'out', 'prompt', *EXPECTED}:
            raise ValueError('Unexpected job fields could change the request or its cost.')
        seen.add(name)


def new_ledger():
    return {
        'schema': 1, 'budgetCents': BUDGET_CENTS,
        'priorSampleAllowanceCents': PRIOR_ALLOWANCE_CENTS,
        'jobReservationCents': JOB_RESERVATION_CENTS,
        'pricingSource': PRICING_SOURCE,
        'accounting': 'conservative reservations; not measured API billing',
        'jobs': [],
    }


def reserved_cents(ledger):
    # Never trust a modified budget or lower reservation in a resumed ledger.
    if (ledger['budgetCents'], ledger['priorSampleAllowanceCents'], ledger['jobReservationCents']) != (
            BUDGET_CENTS, PRIOR_ALLOWANCE_CENTS, JOB_RESERVATION_CENTS):
        raise ValueError('Budget ledger limits were modified.')
    if any(entry['reservationCents'] != JOB_RESERVATION_CENTS for entry in ledger['jobs']):
        raise ValueError('Budget reservation was modified.')
    return PRIOR_ALLOWANCE_CENTS + sum(entry['reservationCents'] for entry in ledger['jobs'])


def reserve(ledger, jobs):
    after = reserved_cents(ledger) + len(jobs) * JOB_RESERVATION_CENTS
    if after > BUDGET_CENTS:
        raise ValueError(f'Budget stop: reservation would reach ${after / 100:.2f}, above $100.')
    for job in jobs:
        ledger['jobs'].append({
            'out': job['out'], 'promptSha256': hashlib.sha256(job['prompt'].encode()).hexdigest(),
            'reservationCents': JOB_RESERVATION_CENTS, 'state': 'reserved',
        })


def save_ledger(path, ledger):
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix('.tmp')
    with temporary.open('w') as file:
        json.dump(ledger, file, indent=2)
        file.write('\n')
        file.flush()
        os.fsync(file.fileno())
    temporary.replace(path)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input', type=Path, default=Path('StoreAssets/image-review/replacement-jobs.jsonl'))
    parser.add_argument('--out-dir', type=Path, default=Path('output/imagegen/training'))
    parser.add_argument('--ledger', type=Path, default=Path('StoreAssets/image-review/api-budget.json'))
    parser.add_argument('--cli', type=Path, default=Path.home() / '.codex/skills/.system/imagegen/scripts/image_gen.py')
    parser.add_argument('--limit', type=int)
    parser.add_argument('--concurrency', type=int, choices=range(1, 9), default=6)
    parser.add_argument('--env-file', type=Path,
                        help='Read OPENAI_API_KEY locally without sourcing shell code or printing it')
    parser.add_argument('--dry-run', action='store_true')
    args = parser.parse_args()
    jobs = [json.loads(line) for line in args.input.read_text().splitlines() if line.strip()]
    validate_jobs(jobs)
    if args.limit is not None and args.limit < 1:
        parser.error('--limit must be positive')
    args.ledger.parent.mkdir(parents=True, exist_ok=True)
    # Serialize controllers, including concurrent invocations from another terminal.
    with args.ledger.with_suffix('.lock').open('w') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        ledger = json.loads(args.ledger.read_text()) if args.ledger.exists() else new_ledger()
        previously_reserved = {entry['out'] for entry in ledger['jobs']}
        pending = [job for job in jobs if job['out'] not in previously_reserved]
        if args.limit:
            pending = pending[:args.limit]
        # Refuse to overwrite unaccounted files; these need provenance review.
        if any((args.out_dir / job['out']).exists() for job in pending):
            parser.error('Unaccounted output exists; review it before generation.')
        reserve(ledger, pending)
        print(json.dumps({
            'newJobs': len(pending), 'previouslyReservedJobs': len(previously_reserved),
            'reservedBudgetUSD': reserved_cents(ledger) / 100, 'ceilingUSD': 100,
            'nominalImageOutputEstimateUSD': round(len(pending) * 0.053, 3),
            'note': 'Estimate excludes prompt tokens; reservations include retries and prior samples. Not billed usage.',
        }, indent=2), flush=True)
        if args.dry_run or not pending:
            return 0
        if args.env_file:
            for line in args.env_file.read_text().splitlines():
                match = re.fullmatch(r'\s*(?:export\s+)?OPENAI_API_KEY\s*=\s*(.*?)\s*', line)
                if match:
                    os.environ['OPENAI_API_KEY'] = match[1].strip().strip('\"\x27')
            os.environ.pop('OPENAI_LOG', None)
        if not os.environ.get('OPENAI_API_KEY'):
            parser.error('OPENAI_API_KEY is not set. No requests made and no reservations saved.')
        if os.environ.get('OPENAI_BASE_URL'):
            parser.error('Custom base URLs are not allowed by this pricing allowance.')
        # This inspects a constant only; API access stays in the bundled CLI.
        from openai import DEFAULT_MAX_RETRIES
        if DEFAULT_MAX_RETRIES != 2:
            parser.error('SDK retry default changed; review the budget before proceeding.')
        if not args.cli.is_file():
            parser.error('Bundled ImageGen CLI not found.')
        save_ledger(args.ledger, ledger)  # Persist every reservation before any paid call.
        args.out_dir.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(prefix='focusmint-image-jobs-') as temporary:
            batch = Path(temporary) / 'jobs.jsonl'
            batch.write_text(''.join(json.dumps(job) + '\n' for job in pending))
            process = subprocess.Popen([
                sys.executable, str(args.cli), 'generate-batch',
                '--input', str(batch), '--out-dir', str(args.out_dir),
                '--concurrency', str(args.concurrency), '--max-attempts', '1', '--no-augment',
            ], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, bufsize=1)
            for line in process.stdout:
                print(line.replace(os.environ['OPENAI_API_KEY'], '[REDACTED]'), end='', flush=True)
            returncode = process.wait()
        for entry in ledger['jobs']:
            if entry['out'] in {job['out'] for job in pending}:
                output = args.out_dir / entry['out']
                entry['state'] = 'generated-unreviewed' if output.is_file() else 'failed-or-unknown'
                if output.is_file():
                    entry['outputSha256'] = hashlib.sha256(output.read_bytes()).hexdigest()
        save_ledger(args.ledger, ledger)
        print('Keep all reservations, including failed/unknown calls; review images before installing assets.')
        return returncode


if __name__ == '__main__':
    raise SystemExit(main())
