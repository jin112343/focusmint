#!/usr/bin/env python3
"""Inspect generated files and make labeled contact sheets for visual review."""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path

from PIL import Image, ImageDraw, ImageOps, ImageStat


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--jobs', type=Path, default=Path('StoreAssets/image-review/replacement-jobs.jsonl'))
    parser.add_argument('--complete', action='store_true')
    parser.add_argument('--overrides', type=Path,
                        help='Map final filenames to accepted regenerated master paths')
    args = parser.parse_args()
    jobs = [json.loads(line) for line in args.jobs.read_text().splitlines() if line.strip()]
    args.output.mkdir(parents=True, exist_ok=True)
    overrides = json.loads(args.overrides.read_text()) if args.overrides else {}
    rows, missing = [], []
    for job in jobs:
        path = Path(overrides.get(job['out'], args.source / job['out']))
        if not path.is_file():
            missing.append(job['id'])
            continue
        with Image.open(path) as image:
            image.load()
            if image.size != (1024, 1024) or image.format != 'WEBP':
                raise ValueError('Unexpected generated format/dimensions: ' + path.name)
            brightness = round(ImageStat.Stat(image.convert('L')).mean[0], 2)
            rows.append({'id': job['id'], 'group': job['group'], 'filename': job['out'],
                         'sourcePath': str(path.resolve()),
                         'size': list(image.size), 'bytes': path.stat().st_size,
                         'brightness': brightness,
                         'sha256': hashlib.sha256(path.read_bytes()).hexdigest()})
    hashes = Counter(row['sha256'] for row in rows)
    duplicates = [row['id'] for row in rows if hashes[row['sha256']] > 1]
    for group in dict.fromkeys(job['group'] for job in jobs):
        group_rows = [row for row in rows if row['group'] == group]
        for start in range(0, len(group_rows), 36):
            page = group_rows[start:start + 36]
            sheet = Image.new('RGB', (1080, ((len(page) + 5) // 6) * 204 + 32), '#f5f5f2')
            draw = ImageDraw.Draw(sheet)
            draw.text((10, 10), f'{group} / {start + 1}-{start + len(page)} / GENERATED MASTERS', fill='#111111')
            for index, row in enumerate(page):
                x, y = index % 6 * 180 + 5, index // 6 * 204 + 32
                with Image.open(row['sourcePath']) as image:
                    thumb = ImageOps.contain(image.convert('RGB'), (170, 170))
                    sheet.paste(thumb, (x, y))
                draw.text((x, y + 175), row['id'], fill='#111111')
            sheet.save(args.output / f'{group}-{start // 36 + 1}.jpg', quality=93)
    report = {'count': len(rows), 'expected': len(jobs), 'missing': missing,
              'exactDuplicates': duplicates, 'bytes': sum(row['bytes'] for row in rows),
              'visuallyReviewed': False, 'images': rows}
    (args.output / 'master-inventory.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({key: value for key, value in report.items() if key != 'images'}))
    if duplicates or (args.complete and missing):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
