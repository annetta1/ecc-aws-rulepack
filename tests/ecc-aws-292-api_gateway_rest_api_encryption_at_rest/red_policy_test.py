class PolicyTest(object):

    def test_resources_with_client(self, base_test, resources, local_ssesion):
        base_test.assertEqual(len(resources), 1)
        base_test.assertFalse(resources[0]['methodSettings']['*/*']['cacheDataEncrypted'])