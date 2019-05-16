# frozen_string_literal: true

class Api::V1::HomeController < ApplicationController
  # ローカル開発のみなので CSRF 対策を向こうにする。
  # 本番サーバーなどにあげる場合はちゃんと対策する必要がある。
  protect_from_forgery only: ['operate_forecast_switch']

  def get_co2_density
    operation_value = 'on'
    operation_target = 'CO2取得スイッチ'
    begin
      co2 = Co2.get_co2
    rescue StandardError => e
      # ちゃんとしないと行けないけれどとりあえず破棄する
      # error_message = "CO2濃度を取得できませんでした"
    end

    result = {
      co2: co2,
      message: create_message(operation_target, operation_value)
    }
    render json: result
  end

  def operate_forecast_switch
    forecast_active_flag = params[:forecast_active_flag].to_s

    operation_target = '天気予報機能'
    rake_command = 'rake forecast_switch:' + forecast_active_flag
    begin
      system(rake_command)
      succeded = true
    rescue StandardError => e
      # ちゃんとしないと行けないけれどとりあえず破棄する
      # error_message = "天気予報機能を操作できませんでした"
      succeded = false
    end
    result = {
      succeded: succeded,
      message: create_message(operation_target, forecast_active_flag)
    }
    render json: result
  end

  def operate_air_controll
    operation_value = params[:air_controll_operation_value]
    operation_target = 'エアコン機能'
    rake_command = 'rake air_controll:' + operation_value
    begin
      system(rake_command)
      succeded = true
    rescue StandardError => e
      # ちゃんとしないと行けないけれどとりあえず破棄する
      # error_message = "天気予報機能を操作できませんでした"
      succeded = false
    end
    result = {
      succeded: succeded,
      message: create_message(operation_target, operation_value)
    }
    render json: result
  end

  private

  def create_message(operation_target, operation_value)
    time = Time.current.strftime('%Y-%m-%d %H:%M')
    user = current_user ? current_user.email : 'guest'
    '・' + time.to_s + ' に ' + user + ' が  ' + operation_target + ' を ' + operation_value + ' にしました。'
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
