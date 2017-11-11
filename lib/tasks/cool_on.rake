namespace :switch do
  desc 'do cool_on'
  task :cool_on => :environment do
    system("irsend SEND_ONCE room cool_on")
  end
end
