#!/usr/bin/python
# coding: utf-8

# モジュールインポート
import RPi.GPIO as GPIO
import time, datetime
import json, urllib2

# 天気予報情報の取得地域設定 ($cityに地域コードを設定)
city = '130010' #横浜

# 鉄道運行状況情報取得する路線名設定
lineName = '東京メトロ東西線'

# 取得する時刻をタプルに格納
timeToGet = ('06:30', '12:30', '17:30')

# LED点滅パターンの基本パターンを辞書に定義
basicPat = {
    'on':    (1, 1, 1, 1), # 点灯したままのパターン
    'off':   (0, 0, 0, 0), # 消灯したままのパターン
    'blink': (0, 1, 0, 1)  # 点滅するパターン
}

# LEDのGPIO番号を連想配列に定義
gpioLed = {
    'fine':  21, # 晴れ用LED
    'cloud': 20, # 曇り用LED
    'rain':  16, # 雨用LED
    'snow':  12, # 雪用LED
    'rail_green': 25, # 鉄道運行状況用 - 緑
    'rail_blue' : 24, # 鉄道運行状況用 - 青
    'rail_red'  : 23  # 鉄道運行状況用 - 赤
}

# GPIOモード設定
# GPIO番号指定をBCM(GPIO番号)に設定
GPIO.setmode(GPIO.BCM)

# gpioLedで定義したすべてのピンを出力モードに設定する
gpioPins = gpioLed.values()
GPIO.setup(gpioPins, GPIO.OUT)

# 更新のピンを入力モードに設定する
GPIO.setup(18, GPIO.IN)

# 取得する時刻の数をカウント
numOfTimeToGet = len(timeToGet)

# 次に取得する時刻を算出する

# 現在の時刻を取得して"hh:mm"形式の文字列に変換
currentTime = datetime.datetime.today()
currentTimeStr = currentTime.strftime('%H:%M')

# デバッグ用 - 現在の時刻を特定の時刻で上書き
#currentTimeStr = '18:00'

# デバッグ用 - 現在の時刻を表示
#print '現在の時刻: ' + currentTimeStr + '\n'

# 現在の時刻に一番近い、次に取得する時刻を timeToGet タプルから探す
# 具体的には、最初に出現する、現在の時刻文字列より大きい文字列を探す
# このwhile文を抜けると、indexに次に取得する時刻の配列番号がセットされる
index = 0;
while currentTimeStr > timeToGet[index]:
    index += 1
    if index == numOfTimeToGet:
        break

# indexが配列の要素数に等しい場合は、現在の時刻より遅い、次に取得する時刻はないので
# 翌日の配列最初の時刻が次の取得時刻になる
today = currentTime.strftime('%Y-%m-%d ')
if index == numOfTimeToGet:
    nextTimeIndex = 0
    # とりあえず本日の日付の取得時刻となるdatetimeオブジェクトを生成
    nextTimeToGet = datetime.datetime.strptime(today + timeToGet[0], '%Y-%m-%d %H:%M')
    # 翌日のdatetimeオブジェクトを生成
    nextTimeToGet += datetime.timedelta(days=+1)
else:
    nextTimeIndex = index
    nextTimeToGet = datetime.datetime.strptime(today + timeToGet[index], '%Y-%m-%d %H:%M')

# デバッグ用
# 次に取得する時刻を表示する
#print '次に取得する時刻: '
#print nextTimeToGet

#  この時点で、以下の情報がある
#  timeToGet:      取得する時刻が格納されているタプル
#  numOfTimeToGet: 取得する時刻の個数
#  nextTimeToGet:  次に取得する時刻(datetimeオブジェクト)
#  nextTimeIndex:  次に取得する時刻のtimeToGetのインデックス

#  あとは以下の処理を行えばよい
#  定期的に現在時刻(datetime.datetime.today())と nextTimeToGet の大小を比較する
#  現在時刻が nextTimeToGet を過ぎたら、Webから情報を取得してLED点滅パターンを更新する
#  nextTimeIndexをプラス1する
#  nextTimeIndexがタプル要素数(numOfTimeToGet)と一致したら nextTimeIndex を 0 に戻す
#  次の取得時刻を nextTimeToGet にセットする(翌日処理に注意)

# --------- 関数 ---------

#情報更新時にLEDを点灯
def NotifyNewInfomationComming():
    #点灯するLEDを定義
    gpioLeds = (
    21, # 晴れ用LED
    20, # 曇り用LED
    16, # 雨用LED
    12, # 雪用LED
    25, # 鉄道運行状況用 - 緑
    24, # 鉄道運行状況用 - 青
    23  # 鉄道運行状況用 - 赤
    )

    GPIO.setup(gpioLeds, GPIO.OUT)

    for repeat in range(0, 5):
        GPIO.output(gpioLeds, True)
        # 0.25秒待つ
        time.sleep(0.25)

# 天気予報情報の取得とLED点滅パターンの設定関数
def SetWeatherLedPattern():
    global city
    global basicPat, ledPat

    # 天気情報の取得URLを生成
    url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=%s' % city

    try:
        # 天気データ取得
        # 最初に指定URLのデータ取得
        response = urllib2.urlopen(url)
        # jsonデータ取得
        weather = json.loads(response.read())
        # 天気予報文字列の取得
        forecast = weather['forecasts'][0]['telop']
        forecast = forecast.encode('utf-8')

    finally:
        response.close()

    # 解析対象外の文字を削除
    forecast = forecast.replace('大', '').replace('暴風', '').replace('雷', '')

    # 「一時」を「時々」に置換
    forecast = forecast.replace('一時', '時々')

    # 「雨か雪」と「雪か雨」をそれぞれ「雨」と「雪」に置換
    forecast = forecast.replace('雨か雪', '雨')
    forecast = forecast.replace('雪か雨', '雪')

    # 晴れの解析
    # 最初に「晴れ」の完全一致を確認
    if forecast == '晴れ':
        # 「晴れ」に完全一致していれば、晴れのLEDは点灯したままのパターン
        ledPat.update({'fine': basicPat['on'] + basicPat['on'] + basicPat['on']})
    else:
        # 「晴」の文字が含まれているか確認
        pos = forecast.find('晴')
        if pos >= 0:
            # 「晴」が含まれている場合
            if pos == 0:
                # 先頭に「晴」がある場合
                ledPat.update({'fine': basicPat['on'] + basicPat['off'] + basicPat['off']})
            else:
                # 先頭に「晴」がない場合は「時々晴」と「のち晴」を確認
                if forecast.find('時々晴') > 0:
                    ledPat.update({'fine': basicPat['off'] + basicPat['blink'] + basicPat['off']})
                else:
                    if forecast.find('のち晴') > 0:
                        ledPat.update({'fine': basicPat['off'] + basicPat['on'] + basicPat['off']})
                    else:
                        # いずれでもない場合は消灯する
                        ledPat.update({'fine': basicPat['off'] + basicPat['off'] + basicPat['off']})
        else:
            # 予報文字列に「晴」はないのでLEDは消灯
            ledPat.update({'fine': basicPat['off'] + basicPat['off'] + basicPat['off']})

    # 曇りの解析
    if forecast == '曇り':
        ledPat.update({'cloud': basicPat['on'] + basicPat['on'] + basicPat['on']})
    else:
        pos = forecast.find('曇')
        if pos >= 0:
            if pos == 0:
                ledPat.update({'cloud': basicPat['on'] + basicPat['off'] + basicPat['off']})
            else:
                if forecast.find('時々曇') > 0:
                    ledPat.update({'cloud': basicPat['off'] + basicPat['blink'] + basicPat['off']})
                else:
                    if forecast.find('のち曇') > 0:
                        ledPat.update({'cloud': basicPat['off'] + basicPat['on'] + basicPat['off']})
                    else:
                        ledPat.update({'cloud': basicPat['off'] + basicPat['off'] + basicPat['off']})
        else:
            ledPat.update({'cloud': basicPat['off'] + basicPat['off'] + basicPat['off']})

    # 雨の解析
    if forecast == '雨':
        ledPat.update({'rain': basicPat['on'] + basicPat['on'] + basicPat['on']})
    else:
        pos = forecast.find('雨')
        if pos >= 0:
            if pos == 0:
                ledPat.update({'rain': basicPat['on'] + basicPat['off'] + basicPat['off']})
            else:
                if forecast.find('時々雨') > 0:
                    ledPat.update({'rain': basicPat['off'] + basicPat['blink'] + basicPat['off']})
                else:
                    if forecast.find('のち雨') > 0:
                        ledPat.update({'rain': basicPat['off'] + basicPat['on'] + basicPat['off']})
                    else:
                        ledPat.update({'rain': basicPat['off'] + basicPat['off'] + basicPat['off']})
        else:
            ledPat.update({'rain': basicPat['off'] + basicPat['off'] + basicPat['off']})


    # 雪の解析
    if forecast == '雪':
        ledPat.update({'snow': basicPat['on'] + basicPat['on'] + basicPat['on']})
    else:
        pos = forecast.find('雪')
        if pos >= 0:
            if pos == 0:
                ledPat.update({'snow': basicPat['on'] + basicPat['off'] + basicPat['off']})
            else:
                if forecast.find('時々雪') > 0:
                    ledPat.update({'snow': basicPat['off'] + basicPat['blink'] + basicPat['off']})
                else:
                    if forecast.find('のち雪') > 0:
                        ledPat.update({'snow': basicPat['off'] + basicPat['on'] + basicPat['off']})
                    else:
                        ledPat.update({'snow': basicPat['off'] + basicPat['off'] + basicPat['off']})
        else:
            # 予報文字列に「雪」はないのでLEDは消灯
            ledPat.update({'snow': basicPat['off'] + basicPat['off'] + basicPat['off']})

# 鉄道運行状況情報の取得とLED点滅パターンの設定関数
def SetRailwayInfoLedPattern():
    global lineName
    global basicPat, ledPat

    # Yahoo! Japan運行情報ページのURL
    # 以下は関東地方の運行情報URL
    url = 'http://transit.yahoo.co.jp/traininfo/area/4/'

    # Yahoo! Japan運行情報ページのHTMLデータ取得して1行ずつリストに格納
    response = urllib2.urlopen(url)
    htmlData = response.read()
    railwayInfo = htmlData.split('\n')

    # ただしテスト用なのでWebからの取得はせずにローカルに保存してあるファイルを読み込む
    # index.htmlをオープンして読み込み、1行ずつリストに格納
    #f = open('./index.html')
    #htmlData = f.read()
    #f.close()
    #railwayInfo = htmlData.split('\n')

    # リストに入れたHTMLデータ各行を解析
    for i in range(0, len(railwayInfo)):
        # 情報取得する路線名文字列が含まれているかチェック
        pos = railwayInfo[i].find(lineName + '</a></td>')
        if pos >= 0:
            # 含まれていれば次の行に運行情報文字列があるので
            # 運行情報に合わせたLEDの色とパターンを格納
            # まず「平常」が含まれるかチェック
            pos = railwayInfo[i+1].find('平常')
            if pos >= 0:
                # 平常運転であればLED色は緑で点灯
                ledPat.update({'rail_green': basicPat['on'] + basicPat['off'] + basicPat['off']})
                ledPat.update({'rail_blue' : basicPat['off'] + basicPat['off'] + basicPat['off']})
                ledPat.update({'rail_red'  : basicPat['off'] + basicPat['off'] + basicPat['off']})
            else:
                # 平常運転でなければ「遅延」が含まれるかチェック
                pos = railwayInfo[i+1].find('遅延')
                if pos >= 0:
                    # 遅延であればLED色は黄色で点滅
                    ledPat.update({'rail_green': basicPat['blink'] + basicPat['blink'] + basicPat['blink']})
                    ledPat.update({'rail_blue' : basicPat['off'] + basicPat['off'] + basicPat['off']})
                    ledPat.update({'rail_red'  : basicPat['blink'] + basicPat['blink'] + basicPat['blink']})
                else:
                    # 平常運転、遅延でもなければLEDを赤点滅して警告する
                    ledPat.update({'rail_green': basicPat['off'] + basicPat['off'] + basicPat['off']})
                    ledPat.update({'rail_blue' : basicPat['off'] + basicPat['off'] + basicPat['off']})
                    ledPat.update({'rail_red'  : basicPat['blink'] + basicPat['blink'] + basicPat['blink']})



#   LED点滅処理
try:
    # 点滅パターン格納用の辞書を初期化
    ledPat = {}

    # 天気予報情報の取得とLED点滅パターンの設定
    SetWeatherLedPattern()

    # 鉄道運行状況情報の取得とLED点滅パターンの設定
    SetRailwayInfoLedPattern()

    # 無限回繰り返す
    while True:
        # 天気表示パターンledPatに入っている点滅パターンの要素数分、点滅制御する
        for num in range(0, len(ledPat['fine'])):
            # 各LEDの点灯・消灯の出力設定をする
            for ledName, gpioPinNumber in gpioLed.items():
                GPIO.output(gpioPinNumber, ledPat[ledName][num])

            # スイッチ状態を確認してスイッチが押されている場合は情報更新する
            if GPIO.input(18) == True:
                # 鉄道運行状況情報の取得とLED点滅パターンの設定
                SetRailwayInfoLedPattern();

                #ledを点灯して、鉄道運行状況情報を更新を示唆
                NotifyNewInfomationComming()
                # デバッグ用
                #print "スイッチが押されたので、鉄道運行状況情報を更新しました。\n\n"

            # 0.25秒待つ
            time.sleep(0.25)

        # 取得時刻になったか確認して、取得時刻を過ぎていたら情報取得する
        if datetime.datetime.today() > nextTimeToGet:

            #ledを点灯して、情報の更新を示唆
            NotifyNewInfomationComming()

            # 点滅パターン格納用の辞書を初期化
            ledPat = {}

            # 天気予報情報の取得とLED点滅パターンの設定
            SetWeatherLedPattern()

            # 鉄道運行状況情報の取得とLED点滅パターンの設定
            SetRailwayInfoLedPattern()

            # 次の取得時刻を nextTimeToGet にセットする
            # indexが配列の要素数に等しい場合は、現在の時刻より遅い、次に取得する時刻はないので
            # 翌日の配列最初の時刻が次の取得時刻になる
            today = currentTime.strftime('%Y-%m-%d ')
            if index == numOfTimeToGet:
                nextTimeIndex = 0
                # とりあえず本日の日付の取得時刻となるdatetimeオブジェクトを生成
                nextTimeToGet = datetime.datetime.strptime(today + timeToGet[0], '%Y-%m-%d %H:%M')
                # 翌日のdatetimeオブジェクトを生成
                nextTimeToGet += datetime.timedelta(days=+1)
            else:
                nextTimeIndex = index
                nextTimeToGet = datetime.datetime.strptime(today + timeToGet[index], '%Y-%m-%d %H:%M')

            # デバッグ用
            # 次に取得する時刻を表示する
            #print '情報を更新しました。\n'
            #print '次の取得時刻: '
            #print nextTimeToGet

# ---------------
#   GPIOリセット
# ---------------
finally:
    GPIO.cleanup()
