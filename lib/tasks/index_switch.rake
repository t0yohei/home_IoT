namespace :index_switch do
  require 'open3'

  desc 'do co2_get'
  task :co2_get => :environment do
    o = Open3.capture3("python #{Rails.root}/scripts/co2_get.py")
      p o
  end
end
