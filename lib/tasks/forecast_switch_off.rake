namespace :switch do
  p "----------test5---------"
  desc 'do forecast_switch_off'
  task :forecast_switch_off => :environment do
    system("python #{Rails.root}/scripts/forecast_switch_off.py")
  end
end
