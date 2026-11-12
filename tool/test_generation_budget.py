import unittest

from generate_training_images import new_ledger, reserve, reserved_cents, validate_jobs, EXPECTED


class BudgetTest(unittest.TestCase):
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
