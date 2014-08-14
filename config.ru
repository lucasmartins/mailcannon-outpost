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
    stats = Sidekiq::Stats.new

  	event_processing_jobs = stats.queues['event_processing'].to_i
    mail_delivery_jobs = stats.queues['secondary_mail_delivery'].to_i + stats.queues['mail_delivery'].to_i + stats.queues['default'].to_i

  	data = [{name: "worker", quantity: mail_delivery_jobs}]
    data << {name: "event_processing_worker", quantity: event_processing_jobs}

    [200, {"Content-Type" => "application/json"}, data.to_json]
  end
end


hirefire_token = ENV['HIREFIRE_TOKEN'] || 'development'

map "/hirefire/#{hirefire_token}/info" do
	run HirefireEndpoint.new
end
