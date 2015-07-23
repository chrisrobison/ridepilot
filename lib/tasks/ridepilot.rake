  namespace :ridepilot do

  #------------- Incremental Seeding ------------------
  desc 'Seed default lookup tables and configurations'
  task :seed_lookup_tables => :environment do
    puts 'trip purposes...'
    seed_file = File.join(Rails.root, 'db', 'tasks', 'seed_trip_purposes.rb')
    load(seed_file) if File.exist?(seed_file)
    puts 'Finished seeding trip purposes'

    puts 'trip results...'
    seed_file = File.join(Rails.root, 'db', 'tasks', 'seed_trip_results.rb')
    load(seed_file) if File.exist?(seed_file)
    puts 'Finished seeding trip results'

    puts 'service levels...'
    seed_file = File.join(Rails.root, 'db', 'tasks', 'seed_service_levels.rb')
    load(seed_file) if File.exist?(seed_file)
    puts 'Finished seeding service levels'

    puts 'mobilities...'
    seed_file = File.join(Rails.root, 'db', 'tasks', 'seed_mobilities.rb')
    load(seed_file) if File.exist?(seed_file)
    puts 'Finished seeding mobilities'

    puts 'lookup table configurations...'
    seed_file = File.join(Rails.root, 'db', 'tasks', 'seed_lookup_table_configurations.rb')
    load(seed_file) if File.exist?(seed_file)
    puts 'Finished seeding lookup table configurations'
  end

  desc 'Seed some fake data for testing'
  task :seed_test_data => :environment do

    for index in 1..5
      customer = Customer.new
      customer.first_name = "Customer_first_name_#{index}"
      customer.last_name = "Customer_last_name_#{index}"
      customer.address = Address.first
      customer.provider = Provider.first
      puts customer.save!
    end
    for index in 1..5
      provider = Provider.find_or_create_by(:name => "provider_name_#{index}")
      puts provider.save!
    end
    for index in 1..5
      #assign to a random provider
      offset = rand(Provider.count)
      random_provider = Provider.offset(offset).first
      provider_id = 
      user = User.find_or_create_by(:email => "abromley#{index}@camsys.com") do |userr|
        userr.password = "welcome1!"  
      end
      user.current_provider_id = random_provider.id
      user.save!
      role = Role.new
      role.user_id = user.id
      role.provider_id = random_provider.id
      role.level = 100
      puts role.save!
    end
  end
  #------------- End of Incremental Seeding --------------
end
