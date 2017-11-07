namespace :index do
  p "----------co2_get_rake_start---------"
  desc 'do co2_get'
  task :co2_get, ['co2'] => :environment do
    p @co2
    system("python #{Rails.root}/scripts/co2_get.py" + @co2)
      p "----------co2_get_rake_finish---------"
  end
end
