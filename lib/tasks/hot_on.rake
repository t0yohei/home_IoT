namespace :switch do
  desc 'do hot_on'
  task :hot_on => :environment do
    system("irsend SEND_ONCE room hot_on")
  end
end
