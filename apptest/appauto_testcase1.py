# -*- coding: UTF-8 -*-
from appium import webdriver
from selenium.webdriver.common.by import By
import time

desired_caps = {'platformName': 'Android',
                'platformVersion': '7.1.2',
                'deviceName': '127.0.0.1:62026',
                'appPackage': 'com.ddnapalon.calculator.gp',
                'appActivity': 'com.ddnapalon.calculator.gp.StartActivity'}
time.sleep(1)
driver = webdriver.Remote('http://127.0.0.1:4723/wd/hub', desired_caps)
time.sleep(3)
driver.find_element(by=By.XPATH, value="//android.widget.TextView[@resource-id='com.ddnapalon.calculator.gp:id/dialog_ok']").click()
time.sleep(2)
driver.find_element(by=By.XPATH, value="//android.widget.ImageView[@resource-id='com.ddnapalon.calculator.gp:id/guide_3']").click()
time.sleep(2)
driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_one']").click()
driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_add']").click()
driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_one']").click()
driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_equal']").click()
time.sleep(2)
driver.find_element(by=By.XPATH, value="//android.widget.Button[@resource-id='com.ddnapalon.calculator.gp:id/btn_c']").click()
time.sleep(5)
driver.quit()



