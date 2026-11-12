import unittest

from generate_training_images import new_ledger, reserve, reserved_cents, validate_jobs, validate_balance_evidence, EXPECTED


class BudgetTest(unittest.TestCase):
    def test_final_balance_phase_keeps_the_total_ceiling(self):
        ledger = new_ledger('balance')
        reserve(ledger, [{'out': str(i), 'prompt': 'photo'} for i in range(40)])
        self.assertEqual(reserved_cents(ledger), 10000)
        with self.assertRaises(ValueError):
            reserve(ledger, [{'out': 'over', 'prompt': 'photo'}])
        self.assertEqual(len(ledger['jobs']), 40)

    def test_dashboard_lag_still_reserves_every_possible_earlier_retry(self):
        evidence = {'project': 'Default project',
                    'scope': 'All API keys, all API sources, last 7 days',
                    'earlierRequests': 100, 'earlierSpendUSD': 20,
                    'completedReviewJobs': 233, 'displayedRequests': 300,
                    'displayedSpendUSD': 30}
        self.assertEqual(validate_balance_evidence(evidence), 8490)
        with self.assertRaises(ValueError):
            validate_balance_evidence({**evidence, 'displayedSpendUSD': 40})
        with self.assertRaises(ValueError):
            validate_balance_evidence({**evidence, 'displayedRequests': 150})

    def test_review_carries_prior_cost_and_stops_at_the_same_total_ceiling(self):
        ledger = new_ledger('review')
        reserve(ledger, [{'out': str(i), 'prompt': 'photo'} for i in range(250)])
        self.assertEqual(reserved_cents(ledger), 10000)
        with self.assertRaises(ValueError):
            reserve(ledger, [{'out': 'over', 'prompt': 'photo'}])
        self.assertEqual(len(ledger['jobs']), 250)
        ledger['priorSampleAllowanceCents'] = 500
        with self.assertRaises(ValueError):
            reserved_cents(ledger)

    def test_all_291_fit_with_retry_and_prior_sample_reservations(self):
        ledger = new_ledger()
        reserve(ledger, [{'out': f'{i}_v2.webp', 'prompt': 'photo'} for i in range(291)])
        self.assertEqual(reserved_cents(ledger), 9230)

    def test_budget_stop_is_atomic_and_unknown_calls_are_not_refunded(self):
        ledger = new_ledger()
        reserve(ledger, [{'out': str(i), 'prompt': 'photo'} for i in range(316)])
        ledger['jobs'][0]['state'] = 'failed-or-unknown'
        self.assertEqual(reserved_cents(ledger), 9980)
        with self.assertRaises(ValueError):
            reserve(ledger, [{'out': 'extra', 'prompt': 'photo'}])
        self.assertEqual(len(ledger['jobs']), 316)
        self.assertEqual(reserved_cents(ledger), 9980)

    def test_modified_request_or_budget_cannot_bypass_allowance(self):
        job = {**EXPECTED, 'out': 'smile_01_v2.webp', 'prompt': 'photo'}
        validate_jobs([job])
        for key, value in [('n', 2), ('quality', 'high'), ('size', 'auto'), ('model', 'other')]:
            with self.assertRaises(ValueError):
                validate_jobs([{**job, key: value}])
        with self.assertRaises(ValueError):
            validate_jobs([{**job, 'prompt': 'x' * 4097}])
        ledger = new_ledger()
        ledger['budgetCents'] = 20000
        with self.assertRaises(ValueError):
            reserve(ledger, [])


if __name__ == '__main__':
    unittest.main()
