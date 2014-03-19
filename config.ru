require 'rubygems'
require 'rack'
require 'json'
require 'sidekiq'

redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379'
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'mailcannon', :size => 1, :url => redis_url }
end

class HirefireEndpoint
  def call(env)  	 
  	number_of_jobs = Sidekiq::Stats.new.enqueued
  	data = [{name: "mailcannon", quantity: number_of_jobs}]
    [200, {"Content-Type" => "application/json"}, data.to_json]
  end
end


hirefire_token = ENV['HIREFIRE_TOKEN'] || 'development'

map "/hirefire/#{hirefire_token}/info" do
	Rack::Handler::Thin.run HirefireEndpoint.new, :Port => 80
end