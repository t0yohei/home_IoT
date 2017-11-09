#!/usr/bin/python
# coding: utf-8

import time
import RPi.GPIO as GPIO

PIN_PWM = 14

def getPwm():
        GPIO.setwarnings(False)
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(PIN_PWM,GPIO.IN)
        time.sleep(0.2)

        while GPIO.input(PIN_PWM) == 1:
                last_high = time.time()
        while GPIO.input(PIN_PWM) == 0:
                last_low = time.time()
        while GPIO.input(PIN_PWM) == 1:
                last_high = time.time()

        span_high = (last_high - last_low) * 1000
        print("span_high : " + str(span_high))


        while GPIO.input(PIN_PWM) == 0:
                last_low = time.time()
        while GPIO.input(PIN_PWM) == 1:
                last_high = time.time()
        while GPIO.input(PIN_PWM) == 0:
                last_low = time.time()

        span_low = (last_low - last_high) * 1000
        print("span_low : " + str(span_low))

        print("Cycle : " + str(span_high + span_low))

        co2     = 5000 * ( span_high - 2 ) / ( span_high + span_low - 4 )

        print("co2濃度は" + co2 + "ppt")
        GPIO.cleanup()
        return co2
