class HomeController < ApplicationController
  $message = ""
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

  def forecast_switch_on
    @switch = params[:forecast_switch]
      system('rake switch:forecast_switch_on')
      render action: :index
  end

  def forecast_switch_off
    @switch = params[:forecast_switch]
      system('rake switch:forecast_switch_off')
      render action: :index
  end

  def cool_on
    @switch = params[:air_condition_switch]
    p "-----cool_on_contoroller--------"
    p @switch
      system('rake switch:cool_on')
      $message = $message + "cool_on_now"
      render action: :index
  end

  def hot_on
    @switch = params[:air_condition_switch]
    p "-----hot_on_contoroller--------"
    p @switch
      system('rake switch:hot_on')
      $message = $message + "hot_on_now"
      render action: :index
  end

  def dry_on
    @switch = params[:air_condition_switch]
    p "-----dry_on_contoroller--------"
    p @switch
      system('rake switch:dry_on')
      $message = $message + "dry_on_now"
      render action: :index
  end

  def air_off
    @switch = params[:air_condition_switch]
    p "-----air_off_contoroller--------"
    p @switch
      system('rake switch:air_off')
      $message = $message + "air_off_now"
      render action: :index
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
