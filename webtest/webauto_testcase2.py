# -*- coding: UTF-8 -*-
import datetime
import os
import sys
import time
import unittest
import pymysql
from selenium import webdriver
import sys
# 下面的两个方法可以将testconfig.config模块路径加到当前模块扫描的路径里：
# sys.path.append(’引用模块的地址')
# sys.path.insert(0,'’引用模块的地址'')
sys.path.insert(0, '..')
# sys.path.append("..")
from testconfig.config import getConfig
from testconfig import HTMLTestRunner


PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)
global driver
HOSTNAME = '127.0.0.1'


class Search(unittest.TestCase):
    """搜索：自动化平台测试开发"""
    def setUp(self):
        time.sleep(1)

    def test_readSQLcase(self):  # 流程的相关接口
        sql = "SELECT id, webfindmethod, webevelement, weboptmethod, webtestdata, webassertdata, `webtestresult` " \
              "from webtest_webcasestep " \
              "where webtest_webcasestep.Webcase_id=1 " \
              "ORDER BY id ASC"
        coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306,
                               host=getConfig("database", "host"), charset='utf8')
        cursor = coon.cursor()
        aa = cursor.execute(sql)
        info = cursor.fetchmany(aa)
        for ii in info:
            case_list = []
            case_list.append(ii)
            webtestcase(case_list)
        coon.commit()
        cursor.close()
        coon.close()

    def tearDown(self):
        pass


def webtestcase(case_list):
    for case in case_list:
        try:
            case_id = case[0]
            findmethod = case[1]
            evelement = case[2]
            optmethod = case[3]
            testdata = case[4]
        except Exception as e:
            return '测试用例格式不正确！%s' % e
        print(case)
        time.sleep(5)
        if optmethod == 'sendkeys' and findmethod == 'find_element_by_id':
            print(evelement)
            driver.find_element_by_id(evelement).send_keys(testdata)
        elif optmethod == 'click' and findmethod == 'find_element_by_name':
            print(evelement)
            driver.find_element_by_name(evelement).click()
        elif optmethod == 'click' and findmethod == 'find_element_by_id':
            print(evelement)
            driver.find_element_by_id(evelement).click()


if __name__ == '__main__':
    driver = webdriver.Chrome()
    # driver = webdriver.Firefox()
    # driver =webdriver.Ie(iedriver)
    driver.get("http://www.baidu.com")
    time.sleep(2)
    now = time.strftime("%Y-%m-%d-%H_%M_%S", time.localtime(time.time()))
    nowTime = datetime.datetime.now().strftime('%Y-%m-%d_%H%M%S')
    testunit = unittest.TestSuite()
    testunit.addTest(Search("test_readSQLcase"))
    filename = "D:\\Program Files\\Python36-32\\Scripts\\autotest\\webtest\\templates\\" + 'webtest_report' + '{}'.format(nowTime) + ".html"
    fp = open(filename, 'wb')
    runner = HTMLTestRunner.HTMLTestRunner(stream=fp, title=u"web 自动化测试报告", description=u"搜索测试用例")
    runner.run(testunit)
    time.sleep(10)
    driver.quit()
    print('Done!')
    time.sleep(1)
