class PolicyTest(object):

    def test_resources(self, base_test, resources):
        base_test.assertEqual(len(resources), 1)
        base_test.assertIn(resources[0]['Status']['State'], ['RUNNING', 'WAITING'])
        base_test.assertRegexpMatches(resources[0]['MasterPublicDnsName'], "^([0-9]{1,3}\.){3}[0-9]{1,3}$")