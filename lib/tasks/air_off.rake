namespace :switch do
  p "----------air_off_rake_start---------"
  desc 'do air_off'
  task :air_off => :environment do
    system("irsend SEND_ONCE room air_off")
      p "----------air_off_rake_finish---------"
  end
end
