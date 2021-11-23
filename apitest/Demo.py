# encoding: utf-8
import time
import unittest
import unitclass


class unittestsum(unittest.TestCase):
    def setUp(self):
        time.sleep(1)

    def test_testcase1(self):
        self.assertEqual(unitclass.sum(1, 1), 2, print('test1 sum success'))

    def test_testcase2(self):
        self.assertEqual(unitclass.sum(1, 1), 2, print('test2 sum success'))

    @unittest.skip('暂时跳过测试用例 3 的测试')
    def test_testcase3(self):
        self.assertEqual(unitclass.sum(1, 1), 2, print('test3 sum success'))


if __name__ == "__main__":
    unittest.main()
