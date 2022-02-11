# -*- coding:utf-8 -*-

# a = [1, 2, 3, 4, 5, 6]
# b = 3
# if b in a:
#     print("b在a中")
# else:
#     print("a不在b中")


def urlParam(param):
    param1 = param.replace('&quot;', '"')
    return param1
