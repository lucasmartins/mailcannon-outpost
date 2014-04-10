require 'rubygems'
require 'rack'
require 'json'
require 'sidekiq'
require 'airbrake'

redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379'
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'mailcannon', :size => 1, :url => redis_url }
end

class HirefireEndpoint
  def call(env)
  	number_of_jobs = Sidekiq::Stats.new.enqueued
  	data = [{name: "worker", quantity: number_of_jobs}]
    [200, {"Content-Type" => "application/json"}, data.to_json]
  end
end

hirefire_token = ENV['HIREFIRE_TOKEN'] || 'development'

map "/hirefire/#{hirefire_token}/info" do
	run HirefireEndpoint.new
end

Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_TOKEN']
  ## can also set the environment over here
  config.environment_name = ENV['RACK_ENV'] || "development"
end

app = Rack::Builder.app do
  use Airbrake::Rack
  run lambda { |env| raise "Rack down" }
end

use Airbrake::Rack
run app
