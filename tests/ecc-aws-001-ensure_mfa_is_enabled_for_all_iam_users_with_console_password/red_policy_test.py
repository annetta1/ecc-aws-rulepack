class PolicyTest(object):
    

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertTrue(resources[0]['c7n:credential-report']['password_enabled'])
        base_test.assertFalse(resources[0]['c7n:credential-report']['mfa_active'])

