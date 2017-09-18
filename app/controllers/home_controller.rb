class HomeController < ApplicationController
  def index
  end

  def show
  end

  def forecast_switch
    @switch = params[:forecast_switch]
    if @switch == "on"
      p "test"
      system('rake switch:forecast_switch_on')
    end
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
