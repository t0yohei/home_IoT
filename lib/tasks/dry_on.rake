namespace :switch do
  p "----------dry_on_rake---------"
  desc 'do dry_on'
  task :dry_on => :environment do
    system("irsend SEND_ONCE room dry_on")
      p "----------dry_on_rake_finish---------"
  end
end
