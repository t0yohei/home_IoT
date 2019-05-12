# frozen_string_literal: true

class Api::V1::HomeController < ApplicationController
  $message_log = []

  def get_co2_density
    operation = 'on'
    switch_name = 'CO2取得スイッチ'
    begin
      @co2 = Co2.get_co2
    rescue StandardError => e
      # ちゃんとしないと行けないけれどとりあえず破棄する
      # error_message = "CO2濃度を取得できませんでした"
    end

    message = create_message(switch_name, operation)
    render json: message
  end

  # def forecast_switch
  #   operation = params[:forecast_switch]
  #   switch_name = '天気予報スイッチ'
  #   rake_command = 'rake forecast_switch:' + operation
  #   system(rake_command)
  #   create_message(switch_name, operation)
  #   render action: :index
  # end

  # def air_controll
  #   operation = params[:air_controll]
  #   switch_name = 'エアコンスイッチ'
  #   rake_command = 'rake air_controll:' + operation
  #   system(rake_command)
  #   create_message(switch_name, operation)
  #   render action: :index
  # end

  private

  def create_message(switch_name, operation)
    time = Time.current.strftime('%Y-%m-%d %H:%M')
    user = current_user ? current_user.email : 'guest'
    message = '・' + time.to_s + ' に ' + user + ' が  ' + switch_name + ' を ' + operation + ' にしました。'
    $message_log.unshift(message)
    message
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
