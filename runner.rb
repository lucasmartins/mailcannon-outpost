require 'bundler'
Bundler.setup(:default)
require 'mailcannon'

# If your client is single-threaded, we just need a single connection in our Redis connection pool
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'mailcannon', :size => 1, :url => 'redis://localhost:16379' }
end

# Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'mailcannon', :url => 'redis://localhost:16379' }
end

# Start up sidekiq via
# ./bin/sidekiq -r ./examples/por.rb
# and then you can open up an IRB session like so:
# irb -r ./examples/por.rb
# where you can then say
# PlainOldRuby.perform_async "like a dog", 3
