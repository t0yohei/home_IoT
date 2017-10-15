namespace :switch do
  p "----------cool_on_rake---------"
  desc 'do cool_on'
  task :cool_on => :environment do
    system("python #{Rails.root}/scripts/cool_on")
  end
end
