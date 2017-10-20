class HomeController < ApplicationController
  require 'date'
  $message_log = []

  def index
    @error_message = ""
    @co2 = "co2入るよ"
    begin
      system('rake index:co2_get[' + @co2 + ']')
      p "-----index_contoroller--------"
    rescue => e
    p e.message
    @error_message = e.message
    end
  end

  def show
  end

  def forecast_switch
    operation = params[:forecast_switch]
    switch_name = "天気予報スイッチ"

    if operation == "on"
      system('rake switch:forecast_switch_on')
    elsif operation == "off"
      system('rake switch:forecast_switch_off')
    end

    create_message(switch_name, operation)
    render action: :index
  end

  def air_controll
    operation = params[:air_condition_switch]
    switch_name = "エアコンスイッチ"

    p "-----air_controll_contoroller--------"
    p operation
    if operation == "cool_on"
      system('rake switch:cool_on')
    elsif operation == "hot_on"
      system('rake switch:hot_on')
    elsif operation == "dry_on"
      system('rake switch:dry_on')
    elsif operation == "air_off"
      system('rake switch:air_off')
    end

    create_message(switch_name, operation)
    render action: :index
  end

  def create_message(switch_name, operation)
    time = Date.today.to_time
    user = current_user.email
    p user
    p user.class
    p time
    p time.class
    message = time.to_s + "に" + user + "が" + switch_name + "を" + operation + "しました。"
    $message_log.unshift(message)
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
