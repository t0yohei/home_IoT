class HomeController < ApplicationController
  def index
  end

  def show
  end

  def forecast_switch_on
    @switch = params[:forecast_switch]
      system('rake switch:forecast_switch_on')
    end
  end

  def forecast_switch_off
    @switch = params[:forecast_switch]
      system('rake switch:forecast_switch_off')
      render action: :index
    end
  end

  def cool_on
    @switch = params[:air_condition_switch]
    p "-----cool_on_cont--------"
      system('rake switch:cool_on')
      render action: :index
    end
  end

  def cool_on
    @switch = params[:air_condition_switch]
    p "-----cool_on_cont--------"
      system('rake switch:cool_on')
      render action: :index
    end
  end

  def forecast_params
    params.permit(:forecast_switch)
  end
end
