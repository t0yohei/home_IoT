namespace :switch do
  p "----------dry_on_rake---------"
  desc 'do dry_on'
  task :dry_on => :environment do
    system("python #{Rails.root}/scripts/dry_on")
  end
end
