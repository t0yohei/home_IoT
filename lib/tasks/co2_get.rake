namespace :index do
  require 'open3'
  p "----------co2_get_rake_start---------"
  desc 'do co2_get'
  task :co2_get => :environment do
    o, e, s = Open3.capture3("python #{Rails.root}/scripts/co2_get.py getPwm")
      p o
      p "----------co2_get_rake_finish---------"
  end
end
