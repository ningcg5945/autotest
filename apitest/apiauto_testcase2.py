# -*- coding:utf-8 -*-
# re模块是python独有的匹配字符串的模块，该模块中提供的很多功能是基于正则表达式实现的，而正则表达式是对字符串进行模糊匹配，提取自己需要的字符串部分，他对所有的语言都通用
# requests模块，支持HTTP连接保持和连接池，支持使用cookie保持会话，支持文件上传，支持自动响应内容的编码，支持国际化的URL和POST数据自动编码
# time模块，提供各种操作时间的函数
import requests, time, re
# urllib，是 Python 标准库中用于网络请求的库。该库有四个模块，分别是urllib.request，urllib.error，urllib.parse，urllib.robotparser
# 其中urllib.request 发起请求，获取请求返回结果
import urllib.request

import pymysql
import json

# import fconfig

HOSTNAME = '127.0.0.1'


def test_readSQLcase():
    # 查询的SQL语句
    sql = "SELECT id,`apiname`,apiurl,apimethod,apiparamvalue,apiresult,`apistatus` from apitest_apis "
    # 打开数据库连接
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306, host='127.0.0.1', charset='utf8')
    # 使用cursor()方法获取操作游标
    cursor = coon.cursor()
    # 执行一个SQL语句
    aa = cursor.execute(sql)
    # 获取返回所有数据
    info = cursor.fetchall()
    # 获取返回的aa数据
    # info = cursor.fetchmany(aa)
    # 打印获取返回的数据
    print(info)
    # for循环，遍历info的数据字符串过程中，迭代变量 ii 会先后被赋值为 info 的数据字符串中的每个字符，并代入循环体中使用
    for ii in info:
        # 将赋值后的 ii 数据字符串,用数组排列，并赋值给 case_list
        case_list = [ii]
        # 调用 interfaceTest 函数方法，变量名 case_list 的值为 ii 数组数据字符串
        interfaceTest(case_list)

    # 将数据提交，否则数据就只会保存在内存中，下次使用的时候就会消失
    coon.commit()
    # 关闭当前游标对象
    cursor.close()
    # 关闭数据库连接
    coon.close()


# 定义名为 interfaceTest 函数方法，变量名为 case_list
def interfaceTest(case_list):
    res_flags = []
    request_urls = []
    responses = []
    strinfo = re.compile('{seturl}')
    for case in case_list:
        try:
            case_id = case[0]
            interface_name = case[1]
            method = case[3]
            url = case[2]
            param = case[4]
            res_check = case[5]
        except Exception as e:
            return '测试用例格式不正确！%s' % e
        if param == '':
            new_url = 'http://' + 'api.test.com.cn' + url
        elif param == 'null':
            url = strinfo.sub(str(seturl('seturl')), url)
            new_url = 'http://' + url
        else:
            url = strinfo.sub(str(seturl('seturl')), url)
            new_url = 'http://' + '127.0.0.1' + url
            request_urls.append(new_url)
        if method.upper() == 'GET':
            headers = {'Authorization': '', 'Content-Type': 'application/json'}
            if "=" in urlParam(param):
                data = None
                print(
                    str(case_id) + ' request is get' + new_url.encode('utf-8') + '?' + urlParam(param).encode('utf-8'))
                results = requests.get(new_url + '?' + urlParam(param), data, headers=headers).text
                print(' response is get' + results.encode('utf-8'))
                responses.append(results)
                res = readRes(results, '')
            else:
                print(' request is get ' + new_url + ' body is ' + urlParam(param))
                # 定义 data 参数无
                data = None
                # Request请求方法，url 参数是请求链接，这个是必传参数，其他的都是可选参数；data 参数跟 urlopen() 中的 data 参数用法相同；
                # headers 参数是指定发起的 HTTP 请求的头部信息；method 参数指的是发起的 HTTP 请求的方式
                req = urllib.request.Request(url=new_url, data=data, headers=headers, method="GET")
                try:
                    # 获取到 req 页面的源代码
                    results = urllib.request.urlopen(req).read()
                    print(' response is get ')
                    print(results)
                except Exception as e:
                    return caseWriteResult(case_id, '0')
                res = readRes(results, res_check)
                if 'pass' == res:
                    res_flags.append('pass')
                    writeResult(case_id, '1')
                    caseWriteResult(case_id, '1')
                else:
                    res_flags.append('fail')
                    writeResult(case_id, '0')
                    caseWriteResult(case_id, '0')
                    writeBug(case_id, interface_name, new_url, results, res_check)

        if method.upper() == 'PUT':
            headers = {'Host': HOSTNAME, 'Connection': 'keep-alive', 'CredentialId': id,
                       'Content-Type': 'application/json'}
            body_data = param
            results = requests.put(url=url, data=body_data, headers=headers)
            responses.append(results)
            res = readRes(results, res_check)
            if 'pass' == res:
                writeResult(case_id, 'pass')
                res_flags.append('pass')
            else:
                res_flags.append('fail')
                writeResult(case_id, 'fail')
                writeBug(case_id, interface_name, new_url, results, res_check)

        if method.upper() == "PATCH":
            headers = {'Authorization': 'Credential ' + id, 'Content-Type': 'application/json'}
            data = None
            results = requests.patch(new_url + '?' + urlParam(param), data, headers=headers).text
            responses.append(results)
            res = readRes(results, res_check)
            if 'pass' == res:
                writeResult(case_id, 'pass')
                res_flags.append('pass')
            else:
                res_flags.append('fail')
                writeResult(case_id, 'fail')
                writeBug(case_id, interface_name, new_url, results, res_check)

        if method.upper() == "POST":
            headers = {'Authorization': 'Credential ' + id, 'Content-Type': 'application/json'}
            if "=" in urlParam(param):
                data = None
                results = requests.patch(new_url + '?' + urlParam(param), data, headers=headers).text
                print(' response is post' + results.encode('utf-8'))
                responses.append(results)
                res = readRes(results, '')
            else:
                print(str(case_id) + ' request is ' + new_url.encode('utf-8') + ' body is ' + urlParam(param).encode(
                    'utf - 8'))
                results = requests.post(new_url, data=urlParam(param).encode('utf-8'), headers=headers).text
                print(' response is post' + results.encode('utf-8'))
                responses.append(results)
                res = readRes(results, res_check)
            if 'pass' == res:
                writeResult(case_id, '1')
                res_flags.append('pass')
            else:
                res_flags.append('fail')
                writeResult(case_id, '0')
                writeBug(case_id, interface_name, new_url, results, res_check)


def readRes(res, res_check):
    res = res.decode().replace('":"', "=").replace('":', "=")
    res_check = res_check.split(';')
    for s in res_check:
        if s in res:
            pass
        else:
            return '错误，返回参数和预期结果不一致' + s
    return 'pass'


def urlParam(param):
    param1 = param.replace('&quot;', '"')
    return param1


def CredentialId():
    global id
    url = 'http://' + 'api.test.com.cn' + '/api/Security/Authentication/Signin/web'
    body_data = json.dumps({"Identity": 'test', "Password": 'test'})
    headers = {'Connection': 'keep-alive', 'Content-Type': 'application/json'}
    response = requests.post(url=url, data=body_data, headers=headers)
    data = response.text
    regx = '.*"CredentialId":"(.*)","Scene"'
    pm = re.search(regx, data)
    id = pm.group(1)


def seturl(set):
    global setvalue
    sql = "SELECT `setname`,`setvalue` from set_set"
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306, host='127.0.0.1', charset='utf8')
    cursor = coon.cursor()
    aa = cursor.execute(sql)
    info = cursor.fetchmany(aa)
    print(info)
    coon.commit()
    cursor.close()
    coon.close()
    if info[0][0] == set:
        setvalue = info[0][1]
        print(setvalue)
    return setvalue


def writeResult(case_id, result):
    result = result.encode('utf-8')
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    sql = "UPDATE apitest_apistep set apitest_apistep.apistatus=%s,apitest_apistep.create_time=%s where apitest_apistep.id=%s;"
    param = (result, now, case_id)
    print('api autotest result is ' + result.decode())
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306, host='127.0.0.1', charset='utf8')
    cursor = coon.cursor()
    cursor.execute(sql, param)
    coon.commit()
    cursor.close()
    coon.close()


def caseWriteResult(case_id, result):
    result = result.encode('utf-8')
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    sql = "UPDATE apitest_apis set apitest_apis.apistatus=%s,apitest_apis.create_time=%s where apitest_apis.id=%s;"  # ,apitest_apis.apiresponse=%s
    param = (result, now, case_id)
    print('api autotest result is ' + result.decode())
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306, host='127.0.0.1', charset='utf8')
    cursor = coon.cursor()
    cursor.execute(sql, param)
    coon.commit()
    cursor.close()
    coon.close()


def writeBug(bug_id, interface_name, request, response, res_check):
    interface_name = interface_name.encode('utf-8')
    res_check = res_check.encode('utf-8')
    request = request.encode('utf-8')
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    bugname = str(bug_id) + '_' + interface_name.decode() + '_出错了'
    bugdetail = '[请求数据]<br />' + request.decode() + '<br/>' + '[预期结果]<br/>' + res_check.decode() + '<br/>' + '<br/>' + '[响应数据]<br />' + '<br/>' + response.decode()
    print(bugdetail)
    sql = "INSERT INTO `bug_bug` (`bugname`,`bugdetail`,`bugstatus`,`buglevel`, `bugcreater`, `bugassign`,`created_time`,`Product_id`) " \
          "VALUES ('%s','%s','激活','1','Ning', 'Ning', '%s', '2');" % (bugname, pymysql.escape_string(bugdetail), now)
    coon = pymysql.connect(user='root', passwd='test123456', db='autotest', port=3306, host='127.0.0.1', charset='utf8')
    cursor = coon.cursor()
    cursor.execute(sql)
    coon.commit()
    cursor.close()
    coon.close()


if __name__ == '__main__':
    test_readSQLcase()
    print('Done!')
    time.sleep(5)
