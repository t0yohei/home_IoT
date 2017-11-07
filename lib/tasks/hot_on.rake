namespace :switch do
  p "----------hot_on_rake---------"
  desc 'do hot_on'
  task :hot_on => :environment do
    system("irsend SEND_ONCE room hot_on")
      p "----------hot_on_rake_finish---------"
  end
end
