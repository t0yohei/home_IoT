# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # CO2濃度取得
  root 'home#index'
  # get 'home/index'
  # post 'home/index'
  # get 'home/show'

  # #スイッチ系
  # post 'home/control_forecast_switch'
  # post 'home/air_controll'

  # API
  namespace :api, format: 'json' do
    namespace :v1 do
      namespace :home do
        get 'get_co2_density'
        post 'operate_forecast_switch'
        post 'operate_air_controll'
      end
    end
  end
end
