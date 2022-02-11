# -*- coding: UTF-8 -*-
from appium import webdriver
from selenium.webdriver.common.by import By
import time
import unittest
import os
PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)
global driver


class Login(unittest.TestCase):
    def setUp(self):
        desired_caps = {'device': 'android',
                        'platformName': 'Android',
                        'platformVersion': '7.1.2',
                        'deviceName': '127.0.0.1:62026',
                        'app': PATH('D:\\jsq.apk'),
                        'appPackage': 'com.ddnapalon.calculator.gp',
                        'appActivity': 'com.ddnapalon.calculator.gp.StartActivity'}

        time.sleep(2)
        self.driver = webdriver.Remote('http://127.0.0.1:4723/wd/hub', desired_caps)

    def test_login(self):
        time.sleep(3)
        self.driver.find_element(by=By.XPATH, value="//android.widget.TextView[@resource-id='com.ddnapalon.calculator.gp:id/dialog_ok']").click()
        time.sleep(2)
        self.driver.find_element(by=By.XPATH, value="//android.widget.ImageView[@resource-id='com.ddnapalon.calculator.gp:id/guide_3']").click()
        time.sleep(2)
        self.driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_one']").click()
        self.driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_add']").click()
        self.driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_one']").click()
        self.driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_equal']").click()
        time.sleep(2)
        self.driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_c']").click()
        time.sleep(5)

    def tearDown(self):
        self.driver.quit()


if __name__ == '__main__':
    unittest.main()




