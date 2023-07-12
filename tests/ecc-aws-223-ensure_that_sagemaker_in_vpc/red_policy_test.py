class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertFalse(resources[0]['SecurityGroups'])
        base_test.assertEqual(resources[0] ['DirectInternetAccess'], 'Enabled')