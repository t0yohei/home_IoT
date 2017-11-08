namespace :switch do
  desc 'do air_off'
  task :air_off => :environment do
    system("irsend SEND_ONCE room air_off")
  end
end
