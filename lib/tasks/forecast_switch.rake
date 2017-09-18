namespace :switch do
  desc 'do forecast_switch script'
  task :forecast_switch => :environment do
    system("python #{Rails.root}/scripts/operation.py")
  end
end
