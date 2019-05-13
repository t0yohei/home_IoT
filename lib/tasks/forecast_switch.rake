namespace :forecast_switch do

  desc 'do forecast_switch_off'
  task :false => :environment do
    system("python #{Rails.root}/scripts/forecast_switch_off.py")
  end

  desc 'do forecast_switch_on'
  task :true => :environment do
    system("python #{Rails.root}/scripts/forecast_switch_on.py")
  end

end
