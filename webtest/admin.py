# -*- coding:utf-8 -*-

from django.contrib import admin

from django.contrib import admin

from webtest.models import Webcase, Webcasestep


# Register your models here./在这里注册您的模型
class WebcasestepAdmin(admin.TabularInline):
    list_display = ['webcasename', 'webteststep', 'webtestobjname', 'webfindmethod', 'webevelement', 'weboptmethod',
                    'webassertdata',
                    'webtestresult', 'create_time', 'id', 'webcase']

    model = Webcasestep

    extra = 1


class WebcaseAdmin(admin.ModelAdmin):
    list_display = ['webcasename', 'webtestresult', 'create_time', 'id']

    inlines = [WebcasestepAdmin]


admin.site.register(Webcase, WebcaseAdmin)
