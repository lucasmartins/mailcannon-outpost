require 'bundler'
Bundler.setup(:default)
require 'mailcannon'
require "kiqstand"
require 'hirefire-resource'

redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379'
MAILCANNON_ENV = ENV['MAILCANNON_ENV'] || 'development'
Mongoid.load!("config/mongoid.yml", MAILCANNON_ENV)
puts "Redis Connection: #{redis_url}"
puts "Mongoid sessions: #{Mongoid.sessions}"

# If your client is single-threaded, we just need a single connection in our Redis connection pool
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'mailcannon', :size => 1, :url => redis_url }
end

# Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'mailcannon', :url => redis_url }
  config.server_middleware do |chain|
    chain.add Kiqstand::Middleware
  end
end

HireFire::Resource.configure do |config|
  config.dyno(:worker) do
    HireFire::Macro::Sidekiq.queue
  end
end



# Start up sidekiq via
# ./bin/sidekiq -r ./examples/por.rb
# and then you can open up an IRB session like so:
# irb -r ./examples/por.rb
# where you can then say
# PlainOldRuby.perform_async "like a dog", 3
