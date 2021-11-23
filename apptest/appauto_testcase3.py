# -*- coding: UTF-8 -*-
import datetime
import os
import unittest
import pymysql, time
import self
from apitest import HTMLTestRunner
from apitest.config import getConfig
# from config import getConfig
from selenium.webdriver.common.by import By
from appium import webdriver

HOSTNAME = '127.0.0.1'

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)
global driver


class Calculator(unittest.TestCase):
    # 测试开始前执行的方法
    def setup(self):
        time.sleep(1)

    # 流程的相关步骤
    def test_readSQLcase(self):
        sql = "SELECT id,`apptestobjname`,appfindmethod,appevelement,appoptmethod,apptestdata,appassertdata," \
              "`apptestresult` from apptest_appcasestep where apptest_appcasestep.Appcase_id=1 ORDER BY id ASC "
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

    # 测试结束后执行的方法
    def tearDown(self):
        pass


def apptestcase(case_list, t=500, n=1):
    for case in case_list:
        try:
            case_id = case[0]
            testobjname = case[1]
            findmethod = case[2]
            evelement = case[3]
            optmethod = case[4]
            testdata = case[5]
        except Exception as e:
            return '测试用例格式不正确！%s' % e
        print(testobjname)
        time.sleep(1)
        if optmethod == 'swipe' and findmethod == 'swipe_left':
            s = driver.get_window_size()
            x1 = s['width'] * 0.75
            y1 = s['height'] * 0.5
            x2 = s['width'] * 0.25
            for i in range(n):
                driver.swipe(x1, y1, x2, y1, t)
                writeResult(case_id, '1')
            time.sleep(1)
        elif optmethod == 'swipe' and findmethod == 'swipe_right':
            l = driver.get_window_size()
            x1 = l['width'] * 0.25
            y1 = l['height'] * 0.5
            x2 = l['width'] * 0.75
            for i in range(n):
                driver.swipe(x1, y1, x2, y1, t)
                writeResult(case_id, '1')
            time.sleep(1)
        elif optmethod == 'click':
            # driver.find_element(by=By.XPATH, value=evelement).click()
            usn = driver.find_element(by=By.XPATH, value=evelement)
            usn.click()
            time.sleep(1)
            writeResult(case_id, '1')
        elif optmethod == 'sendkey':
            # driver.find_element(by=By.XPATH, value=evelement).send_keys(testdata)
            usn = driver.find_element(by=By.XPATH, value=evelement)
            usn.click()
            usn.send_keys(testdata)
            time.sleep(1)
            writeResult(case_id, '1')


def writeResult(case_id, result):
    result = result.encode('utf-8')
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    sql = "UPDATE apptest_appcasestep set apptest_appcasestep.apptestresult=%s,apptest_appcasestep.create_time=%s " \
          "where apptest_appcasestep.id=%s; "
    param = (result, now, case_id)
    print('app autotest result is ' + result.decode())
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306, host='127.0.0.1', charset='utf8')
    cursor = coon.cursor()
    cursor.execute(sql, param)
    coon.commit()
    cursor.close()
    coon.close()


def caseWriteResult(case_id, result):
    result = result.encode('utf-8')
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    sql = "UPDATE apptest_appcase set apptest_apptest.apptestresult=%s,apptest_apptest.create_time=%s where " \
          "apptest_apptest.id=%s; "
    param = (result, now, case_id)
    print('app autotest result is ' + result.decode())
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306, host='127.0.0.1', charset='utf8')
    cursor = coon.cursor()
    cursor.execute(sql, param)
    coon.commit()
    cursor.close()
    coon.close()


if __name__ == '__main__':
    desired_caps = {'device': 'android',
                    'platformName': 'Android',
                    'browserName': '',
                    'version': '7.1.2',
                    'deviceName': '127.0.0.1:62026',
                    # 'app': mod_config.PATH('D:\\csdn.apk'),
                    # 'appPackage': 'net.csdn.csdnplus',
                    # 'appActivity': 'net.csdn.csdnplus.activity.SplashActivity'}
                    'app': PATH('D:\\CqtxtVjMd1GAGfADAK0vRsKhSm0973.apk'),
                    'appPackage': 'com.youdao.calculator',
                    'appActivity': 'com.youdao.calculator.activities.MainActivity'}

    time.sleep(1)
    driver = webdriver.Remote('http://127.0.0.1:4723/wd/hub', desired_caps)
    time.sleep(1)
    now = time.strftime("%Y-%m-%d-%H_%M_%S", time.localtime(time.time()))
    nowTime = datetime.datetime.now().strftime('%Y-%m-%d_%H%M%S')
    testunit = unittest.TestSuite()
    testunit.addTest(Calculator("test_readSQLcase"))
    filename = "D:\\Program Files\\Python36-32\\Scripts\\autotest\\apptest\\templates\\" + 'apptest_report' + '{}'.format(nowTime) + ".html"
    fp = open(filename, 'wb')
    runner = HTMLTestRunner.HTMLTestRunner(stream=fp, title=u"app 自动化测试汇总报告", description=u"app 自动化测试")
    runner.run(testunit)
    driver.quit()
    print('Done!')
    time.sleep(5)
#
# def test_login(self):
#     time.sleep(1)
#     self.driver.find_element(by=By.XPATH,
#                              value='//android.widget.TextView[@resource-id="net.csdn.csdnplus:id/iknow"]').click()
#     time.sleep(1)
#     self.driver.find_element(by=By.XPATH,
#                              value='//android.widget.TextView[@resource-id="net.csdn.csdnplus:id/tv_tab_two"]').click()
#     time.sleep(1)
#     self.driver.find_element(by=By.XPATH,
#                              value='//android.widget.EditText[@resource-id="net.csdn.csdnplus:id/et_first_account"]').send_keys(
#         "test")
#
#     usn = self.driver.find_element(by=By.XPATH,
#                                    value='//android.widget.EditText[@resource-id="net.csdn.csdnplus:id/et_second_psw"]')
#     usn.click()
#     usn.send_keys("test2")
#     self.driver.find_element(by=By.XPATH,
#                              value='//android.widget.ImageView[@resource-id="net.csdn.csdnplus:id/iv_private"]').click()
#     self.driver.find_element(by=By.XPATH,
#                              value='//android.widget.TextView[@resource-id="net.csdn.csdnplus:id/tv_confirm"]').click()
#     time.sleep(5)
#
# def tearDown(self):
#     self.driver.quit()
#
#
# if __name__ == '__main__':
# unittest.main()
