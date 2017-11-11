namespace :switch do
  desc 'do dry_on'
  task :dry_on => :environment do
    system("irsend SEND_ONCE room dry_on")
  end
end
