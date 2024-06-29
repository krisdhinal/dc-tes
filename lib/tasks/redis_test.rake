namespace :redis do
    desc "Test Redis connection"
    task :test_connection => :environment do
      begin
        redis = Redis.new(url: ENV['REDIS_URL'])
        redis.ping
        puts "Successfully connected to Redis!"
      rescue => e
        puts "Error connecting to Redis: #{e.message}"
      end
    end
  end
  