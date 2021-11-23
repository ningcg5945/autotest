# coding=utf-8
import os
import time
import unittest
from appium import webdriver
from selenium.webdriver.common.by import By

PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)
global driver
