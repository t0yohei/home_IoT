namespace :switch do
  p "----------air_off_rake---------"
  desc 'do air_off'
  task :air_off => :environment do
    system("python #{Rails.root}/scripts/air_off")
  end
end
