namespace :index do
  desc 'do co2_get'
  task :co2_get, ['co2'] => :environment do
    system("python #{Rails.root}/scripts/co2_get.py" + @co2)
  end
end
