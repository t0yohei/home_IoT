#!/usr/bin/python
# coding: utf-8

import os
import RPi.GPIO as GPIO
import time

gpioLeds = (
21, # 晴れ用LED
20, # 曇り用LED
16, # 雨用LED
12, # 雪用LED
25, # 鉄道運行状況用 - 緑
24, # 鉄道運行状況用 - 青
23  # 鉄道運行状況用 - 赤
)

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(gpioLeds, GPIO.OUT)

for repeat in range(0, 5):
    GPIO.output(gpioLeds, False)

GPIO.cleanup()
print('プログラムを終了します。')
time.sleep(3)
pid = os.system('ps aux | grep forecast_switch_on.py | grep -v grep')
print(pid)
os.system('kill -9 %d' % pid)
