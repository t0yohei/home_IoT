namespace :temp do
  desc 'do python script'
  task :test => :environment do
    system("python #{Rails.root}/scripts/test.py")
  end
end
