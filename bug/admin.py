# -*- coding:utf-8 -*-

from django.contrib import admin
from bug.models import Bug


class BugAdmin(admin.ModelAdmin):
    list_display = ['bugname ', 'bugdetail ', ' bugstatus', ' buglevel', ' bugcreater', ' bugassign', 'create_time',
                    'id']


admin.site.register(Bug)  # 把bug管理模块注册到django admin后台并能显示
