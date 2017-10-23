Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #CO2濃度取得
  root 'home#index'
  post 'home/index'
  get 'home/show'

  #スイッチ系
  post 'home/forecast_switch'
  post 'home/air_controll'

end
