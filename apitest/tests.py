# -*- coding:utf-8 -*-

from django.test import TestCase

# Create your tests here.

from apitest.views import test, home, login
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import resolve
from django.urls import reverse
from django.http import HttpRequest
# from apitest.views import test, home, login


class titlePageTest(TestCase):
    def test_loginpage_returns_title_html(self):
        request = HttpRequest()
        response = login(request)
        self.assertIn('<title>自动化测试平台</title>', response.content)

# class contentTest(TestCase):
#     def test_content_url_resolves_to_view(self):
#         request = HttpRequest()
#         response = login(request)
#         self.assertIn(b'test1234567', response.content)
