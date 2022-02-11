# -*- coding: UTF-8 -*-
import time
from selenium import webdriver

if __name__ == '__main__':
    global driver
    driver = webdriver.Chrome()
    driver.get("http://www.baidu.com")
    time.sleep(1)
    driver.find_element_by_id('kw').send_keys('软件自动化测试开发')
    time.sleep(1)
    driver.find_element_by_id('su').click()
    time.sleep(10)
    driver.quit()
    print('Done!')
    time.sleep(1)
