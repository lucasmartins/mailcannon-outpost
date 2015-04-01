require 'bundler'
Bundler.setup(:default)
require 'mailcannon'
require "kiqstand"
require 'librato-rack'
require 'librato-sidekiq'
require 'newrelic_rpm'

redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379'
MAILCANNON_ENV = ENV['MAILCANNON_ENV'] || 'development'
Mongoid.load!("config/mongoid.yml", MAILCANNON_ENV)
puts "Redis Connection: #{redis_url}"
puts "Mongoid sessions: #{Mongoid.sessions}"

Librato::Sidekiq::Middleware.configure do |c|
  c.enabled = true
end

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


# Start up sidekiq via
# ./bin/sidekiq -r ./examples/por.rb
# and then you can open up an IRB session like so:
# irb -r ./examples/por.rb
# where you can then say
# PlainOldRuby.perform_async "like a dog", 3
