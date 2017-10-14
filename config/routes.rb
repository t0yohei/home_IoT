Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/show'
  post 'home/forecast_switch_on'
  post 'home/forecast_switch_off'
  post 'home/cool_on'
  post 'home/hot_on'
  post 'home/dry_on'
  post 'home/air_off'


end
