namespace :ridepilot do

  #------------- Incremental Seeding ------------------
  desc 'Seed default trip purposes'
  task :seed_trip_purposes => :environment do
    seed_file = File.join(Rails.root, 'db', 'tasks', 'seed_trip_purposes.rb')
    load(seed_file) if File.exist?(seed_file)

    puts 'Finished seeding trip purposes'
  end

  desc 'Seed default trip results'
  task :seed_trip_results => :environment do
    seed_file = File.join(Rails.root, 'db', 'tasks', 'seed_trip_results.rb')
    load(seed_file) if File.exist?(seed_file)

    puts 'Finished seeding trip results'
  end

  #------------- End of Incremental Seeding --------------
end
