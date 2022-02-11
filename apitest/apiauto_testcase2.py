# -*- coding:utf-8 -*-
# re正则表达式模块还包括一些有用的操作正则表达式的函数
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
    # fetchall获取返回所有数据
    # info = cursor.fetchall()
    # fetchmany获取返回的aa数据
    info = cursor.fetchmany(aa)
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
    # compile函数，compile(pattern[,flags] ) 根据包含正则表达式的字符串创建模式对象；将 seturl 函数方法中查询的 info 值转换为字符string类型
    strinfo = re.compile('{seturl}')
    # for循环，遍历 case_list 的数组数据字符串过程中，迭代变量 case 会先后被赋值为 info 的数组数据字符串中的每个字符，并代入循环体中使用
    for case in case_list:
        # 尝试执行的代码，正常就走try，异常走except
        try:
            # 将赋值后的 case 数组数据字符串,在用数组排列，并赋值给 case_id 等变量名
            case_id = case[0]
            interface_name = case[1]
            url = case[2]
            method = case[3]
            param = case[4]
            res_check = case[5]
        # 如果case值不[0]~[5]范围内，则执行except异常
        except Exception as e:
            # return 语句是 except 异常时返回的数值 e ,并赋值给对应的异常case值中
            return '测试用例格式不正确！%s' % e
        # if...elif...else 语句判断 param 值
        if param == '':
            # 为''时，new_url 变量值为 http://api.test.com.cn + url
            new_url = 'http://' + 'api.test.com.cn' + url
        elif param == 'null':
            # 为'null'时，变量名 url 为 seturl 函数方法中查询替换后的值；sub()方法进行查询和替换，str 为类型定义
            url = strinfo.sub(str(seturl('seturl')), url)
            # url 值为seturl函数方法中查询替换后的值
            new_url = 'http://' + url
        else:
            # 为 其它 时，变量名 url 为 seturl 函数方法中查询替换后的值；sub()方法进行查询和替换，str 为类型定义
            url = strinfo.sub(str(seturl('seturl')), url)
            # new_url 变量值为 http://127.0.0.1 + url，其中url值为seturl函数方法中查询替换后的值
            new_url = 'http://' + '127.0.0.1' + url
            # request_urls 空数组中，添加新的 new_url ；append()方法用于在列表末尾添加新的对象
            request_urls.append(new_url)
        # if 语句判断 method 值，upper() 方法将字符串中的小写字母转为大写字母
        if method.upper() == 'GET':
            # 设定 headers 变量名的头部信息
            headers = {'Authorization': '', 'Content-Type': 'application/json'}
            # in成员运算符如果在指定的序列中找到值返回 True，否则返回 False；if...else 语句，判断“=”是否在 urlParam(param) 函数方法中
            if '=' in urlParam(param):
                # 定义 data 参数无
                data = None
                # encode()函数：以指定的编码格式编码字符串，默认编码为 'utf-8'；语法：str.encode(encoding='utf-8', errors='strict')
                # encoding 参数可选，即要使用的编码，默认编码为 'utf-8'。字符串编码常用类型有：utf-8,gb2312,cp936,gbk等
                # errors 参数可选，设置不同错误的处理方案。默认为 'strict',意为编码错误引起一个UnicodeEncodeError。 其它可能值有 'ignore', 'replace', 'xmlcharrefreplace'以及通过 codecs.register_error() 注册其它的值。
                print(str(case_id) + ' request is get' + str(new_url.encode('utf-8')) + '?' + str(urlParam(param).encode('utf-8')))
                # requests是简单易用的HTTP库；GET：请求指定的页面信息，并返回实体主体；text输出文本信息
                results = requests.get(new_url + '?' + urlParam(param), data, headers=headers).text
                print(' response is get' + str(new_url.encode('utf-8')))
                # responses 空数组中，添加 results 值；append()方法用于在列表末尾添加新的对象
                responses.append(results)
                #
                res = readRes(results, '')
            else:
                print(' request is get ' + new_url + ' body is ' + urlParam(param))
                # 定义 data 参数无
                data = None
                # Request请求方法，url 参数是请求链接，这个是必传参数，其他的都是可选参数；data 参数跟 urlopen() 中的 data 参数用法相同；
                # headers 参数是指定发起的 HTTP 请求的头部信息；method 参数指的是发起的 HTTP 请求的方式
                req = urllib.request.Request(url=new_url, data=data, headers=headers, method="GET")
                # 尝试执行的代码，正常就走try，异常走except
                try:
                    # urlopen方法，获取到 req 页面的源代码
                    results = urllib.request.urlopen(req).read()
                    print(' response is get ')
                    # 打印获取到的 req 页面的源代码
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

        if method.upper() == "POST":
            headers = {'Authorization': 'Credential ' + id, 'Content-Type': 'application/json'}
            if "=" in urlParam(param):
                data = None
                results = requests.patch(new_url + '?' + urlParam(param), data, headers=headers).text
                print(' response is post' + str(results.encode('utf-8')))
                responses.append(results)
                res = readRes(results, '')
            else:
                print(
                    str(case_id) + ' request is ' + str(new_url.encode('utf-8')) + ' body is ' + urlParam(param).encode(
                        'utf - 8'))
                results = requests.post(new_url, data=urlParam(param).encode('utf-8'), headers=headers).text
                print(' response is post' + str(results.encode('utf-8')))
                responses.append(results)
                res = readRes(results, res_check)
                if 'pass' == res:
                    writeResult(case_id, '1')
                    res_flags.append('pass')
                else:
                    res_flags.append('fail')
                    writeResult(case_id, '0')
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


def readRes(res, res_check):
    res = res.decode().replace('":"', "=").replace('":', "=")
    res_check = res_check.split(';')
    for s in res_check:
        if s in res:
            pass
        else:
            return '错误，返回参数和预期结果不一致' + s
    return 'pass'


# 定义urlParam函数方法，变量名为param值为param = case[4]
def urlParam(param):
    # replace() 方法把字符串中的 old（旧字符串） 替换成 new(新字符串)，如果指定第三个参数max，则替换不超过 max 次;replace()方法语法：str.replace(old, new[, max])
    param1 = param.replace('&quot;', '"')
    # return 语句，返回变量名 param1 的值，并赋值给urlParam函数方法的param值中
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
