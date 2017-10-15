namespace :switch do
  p "----------hot_on_rake---------"
  desc 'do hot_on'
  task :hot_on => :environment do
    system("python #{Rails.root}/scripts/hot_on")
  end
end
