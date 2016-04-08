worker: bundle exec sidekiq -r ./runner.rb --config=config/sidekiq_mail_delivery.yml -v
event_processing_worker: bundle exec sidekiq -r ./runner.rb --config=config/sidekiq_event_processing.yml -v
# the following is used to start the Hirefire endpoint.
web: thin -p $PORT start
