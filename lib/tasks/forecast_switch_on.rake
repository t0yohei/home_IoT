namespace :switch do
  desc 'do forecast_switch_on'
  task :forecast_switch_on => :environment do
    system("python #{Rails.root}/scripts/forecast_switch_on.py")
  end
end
