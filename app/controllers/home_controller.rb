class HomeController < ApplicationController
    require 'open3'
  $message_log = []

  def index
    if user_signed_in?
      operation = "on"
      switch_name = "co2取得スイッチ"
      @error_message = ""
      co2 = "co2入るよ"
      begin
        @co2= Open3.capture3('rake index_switch:co2_get')
      rescue => e
        p e.message
        @error_message = e.message
      end
      create_message(switch_name, operation)
    end
  end

  def show
  end

  def forecast_switch
    operation = params[:forecast_switch]
    switch_name = "天気予報スイッチ"
    rake_command = 'rake forecast_switch:' + operation
    system(rake_command)
    create_message(switch_name, operation)
    render action: :index
  end

  def air_controll
    operation = params[:air_controll]
    switch_name = "エアコンスイッチ"
    rake_command = 'rake air_controll:' + operation
    system(rake_command)
    create_message(switch_name, operation)
    render action: :index
  end

  def create_message(switch_name, operation)
    time = Time.current
    time = time.strftime('%Y-%m-%d %H:%M')
    user = current_user.email
    /@./ =~ user
    message = "・" + time.to_s + " に " + $` + " が  " + switch_name + " を " + operation + " にしました。"
    $message_log.unshift(message)
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
