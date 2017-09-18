class HomeController < ApplicationController
  def index
  end

  def show
  end

  def forecast_switch_on
    @switch = params[:forecast_switch]
    if @switch == "on"
      p "test"
      system('rake switch:forecast_switch_on')
    end
  end

  def forecast_switch_off
    @switch = params[:forecast_switch]
    if @switch == "off"
      system('rake switch:forecast_switch_off')
    end
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
