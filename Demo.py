import unittest
from selenium import webdriver


class Ranzhi(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()  # 选择谷歌浏览器
        self.driver.get('http://www.baidu.com/')
    def test_ranzhi(self):
        pass

    def tearDown(self):
        self.driver.quit()  # 退出浏览器


