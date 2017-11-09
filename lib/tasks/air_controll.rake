namespace :air_controll do

  desc 'do dry_on'
  task :dry_on => :environment do
    system("irsend SEND_ONCE room dry_on")
      p "----------dry_on_rake_finish---------"
  end

  desc 'do cool_on'
  task :cool_on => :environment do
    system("irsend SEND_ONCE room cool_on")
      p "----------cool_on_rake_finish---------"
  end

  desc 'do hot_on'
  task :hot_on => :environment do
    system("irsend SEND_ONCE room hot_on")
      p "----------hot_on_rake_finish---------"
  end

  desc 'do air_off'
  task :air_off => :environment do
    system("irsend SEND_ONCE room air_off")
      p "----------air_off_rake_finish---------"
  end
end
