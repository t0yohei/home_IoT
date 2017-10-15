namespace :switch do
  p "----------cool_on_rake---------"
  desc 'do cool_on'
  task :cool_on => :environment do
    system("irsend SEND_ONCE room cool_on")
      p "----------cool_on_rake_finish---------"
  end
end
