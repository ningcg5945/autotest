import os
import time
import unittest

from appium import webdriver

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)

global driver


class Login(unittest.TestCase):
    def setUp(self):
        desired_caps = {
            'platformName': 'Android',
            'deviceName': '127.0.0.1:62026',
            'platformVersion': '7.1.2',
            'app': PATH('D:\\CqtxtVjMd1GAGfADAK0vRsKhSm0973.apk'),
            # apk包名
            'appPackage': 'com.youdao.calculator',
            # apk的launcherActivity
            'appActivity': 'com.youdao.calculator.activities.MainActivity'
        }
        # Remote 地址在 Appuim 里找
        self.driver = webdriver.Remote('http://127.0.0.1:4723/wd/hub', desired_caps)
        time.sleep(5)

    # 向左滑动
    # def swipe_left(driver, t=500, n=1):
    #     # 获取屏幕size
    #     size = driver.get_window_size()
    #     print(size)  # 返回的时一个dict
    #     width = size['width']
    #     hight = size['height']
    #     print(width, hight)
    #     s = driver.get_window_size()
    #     x1 = s['width'] * 0.75
    #     y1 = s['height'] * 0.5
    #     x2 = s['width'] * 0.25
    #     for i in range(n):
    #         driver.swipe(x1, y1, x2, y1, t)

    def test_swipe_left(self, t=500, n=1):
        time.sleep(1)
        # 获取屏幕size
        # size = self.driver.get_window_size()
        # # print(size)  # 返回的时一个dict
        # width = size['width']
        # hight = size['height']
        # print(width, hight)
        s = self.driver.get_window_size()
        x1 = s['width'] * 0.75
        y1 = s['height'] * 0.5
        x2 = s['width'] * 0.25
        for i in range(n):
            self.driver.swipe(x1, y1, x2, y1, t)
        time.sleep(5)

    def tearDown(self):
        self.driver.quit()


if __name__ == '__main__':
    unittest.main()
