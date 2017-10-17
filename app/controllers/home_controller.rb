class HomeController < ApplicationController
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
    @switch = params[:forecast_switch]
    if @switch == "on"
      system('rake switch:forecast_switch_on')
    elsif @switch == "off"
      system('rake switch:forecast_switch_off')
    end
    message =  "天気予報LEDを" + @switch + "しました。"
    $message_log.unshift(message)
    render action: :index
  end

  def air_controll
    @switch = params[:air_condition_switch]
    p "-----air_controll_contoroller--------"
    p @switch
    if @switch == "cool_on"
      system('rake switch:cool_on')
    elsif @switch == "hot_on"
      system('rake switch:hot_on')
    elsif @switch == "dry_on"
      system('rake switch:dry_on')
    elsif @switch == "air_off"
      system('rake switch:air_off')
    end

      message = "エアコンを" + @switch + "しました"
      $message_log.unshift(message)
      render action: :index
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
