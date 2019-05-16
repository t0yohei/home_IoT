# frozen_string_literal: true

class HomeController < ApplicationController
  require 'open3'
  require 'co2.rb'

  # $message_log = []

  def index
    # if user_signed_in?
    #   operation = "on"
    #   switch_name = "CO2取得スイッチ"
    #   @error_message = ""

    #   Co2.get_co2
    #   create_message(switch_name, operation)
    # end
  end

  # def forecast_switch
  #   operation = params[:forecast_switch]
  #   switch_name = "天気予報スイッチ"
  #   rake_command = 'rake forecast_switch:' + operation
  #   system(rake_command)
  #   create_message(switch_name, operation)
  #   render action: :index
  # end

  # def air_controll
  #   operation = params[:air_controll]
  #   switch_name = "エアコンスイッチ"
  #   rake_command = 'rake air_controll:' + operation
  #   system(rake_command)
  #   create_message(switch_name, operation)
  #   render action: :index
  # end

  # private

  # def create_message(switch_name, operation)
  #   time = Time.current
  #   time = time.strftime('%Y-%m-%d %H:%M')
  #   user = current_user.email
  #   /@./ =~ user
  #   message = "・" + time.to_s + " に " + $` + " が  " + switch_name + " を " + operation + " にしました。"
  #   $message_log.unshift(message)
  # end

  # def forecast_params
  #   params.permit(:forecast_switch)
  # end
end
