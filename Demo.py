# -*- coding: UTF-8 -*-
import pymysql


def readSQL():
    # 查询 SQL 语句
    sql = "SELECT id,`apiname`,apiurl from apitest_apistep where apitest_apistep.Apitest_id=2 "
    # 打开 MySQL 数据库连接


    coon = pymysql.connect(user='root', passwd='test123456', db='autotest'
                       , port=3306, host='127.0.0.1', charset='utf8')
    # 获取数据库操作游标
    cursor = coon.cursor()
    # 执行 MySQL 查询语句
    aa = cursor.execute(sql)
    # 获取执行查询语句后的结果数据列表
    info = cursor.fetchmany(aa)
    print(info)
    # 提交
    coon.commit()
    # 关闭游标
    cursor.close()
    # 关闭连接
    coon.close()

if __name__ == '__main__':
    readSQL()
    print('Done!')