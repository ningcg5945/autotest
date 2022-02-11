# -*- coding:utf-8 -*-
import requests, pymysql, time, sys, re
import urllib, zlib
# import _mysql #import result
# from httplib import ResponseNotReady
from trace import CoverageResults
import json
# from test.test_ast import eval_results
from idlelib.rpc import response_queue
# from cPickle import dumps
from time import sleep
import sys
# 下面的两个方法可以将testconfig.config模块路径加到当前模块扫描的路径里：
# sys.path.append(’引用模块的地址')。
# sys.path.insert(0,'’引用模块的地址'')
sys.path.append("..")
from testconfig.config import getConfig
from selenium.webdriver.common.by import By
from appium import webdriver

HOSTNAME = '127.0.0.1'


def readSQLcase():  # 流程的相关接口
    sql = "SELECT id,`apptestobjname`,appfindmethod,appevelement,appoptmethod,apptestdata,appassertdata,`apptestresult`" \
          "from apptest_appcasestep " \
          "where apptest_appcasestep.Appcase_id = 3 " \
          "ORDER BY id ASC"
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306,
                           host=getConfig("database", "host"), charset='utf8')
    cursor = coon.cursor()
    aa = cursor.execute(sql)
    info = cursor.fetchmany(aa)
    for ii in info:
        case_list = []
        case_list.append(ii)
        apptestcase(case_list)
    coon.commit()
    cursor.close()
    coon.close()


def apptestcase(case_list, t=500, n=1):
    for case in case_list:
        try:
            case_id = case[0]
            findmethod = case[2]
            evelement = case[3]
            optmethod = case[4]
            testdata = case[5]
        except Exception as e:
            return '测试用例格式不正确！%s' % e
        print(evelement)
        time.sleep(1)
        if optmethod == 'swipe' and findmethod == 'swipe_left':
            s = driver.get_window_size()
            x1 = s['width'] * 0.75
            y1 = s['height'] * 0.5
            x2 = s['width'] * 0.25
            for i in range(n):
                driver.swipe(x1, y1, x2, y1, t)
            time.sleep(1)
        elif optmethod == 'swipe' and findmethod == 'swipe_right':
            l = driver.get_window_size()
            x1 = l['width'] * 0.25
            y1 = l['height'] * 0.5
            x2 = l['width'] * 0.75
            for i in range(n):
                driver.swipe(x1, y1, x2, y1, t)
            time.sleep(1)
        elif optmethod == 'click':
            usn = driver.find_element(by=By.XPATH, value=evelement)
            usn.click()
            time.sleep(1)
        elif optmethod == 'sendkey':
            usn = driver.find_element(by=By.XPATH, value=evelement)
            usn.click()
            usn.send_keys(testdata)
            time.sleep(1)


if __name__ == '__main__':
    desired_caps = {'platformName': 'Android',
                    'platformVersion': '7.1.2',
                    'deviceName': '127.0.0.1:62026',
                    'appPackage': 'com.ddnapalon.calculator.gp',
                    'appActivity': 'com.ddnapalon.calculator.gp.StartActivity'}
    time.sleep(2)
    driver = webdriver.Remote('http://127.0.0.1:4723/wd/hub', desired_caps)
    time.sleep(1)
    readSQLcase()
    time.sleep(5)
    driver.quit()
    print('Done!')
    time.sleep(1)
