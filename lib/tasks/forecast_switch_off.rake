namespace :switch do
  desc 'do forecast_switch_off'
  task :forecast_switch_off => :environment do
    system("python #{Rails.root}/scripts/forecast_switch_off.py")
  end
end
