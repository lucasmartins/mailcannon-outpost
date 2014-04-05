worker: bundle exec sidekiq -r ./runner.rb --config=config/sidekiq.yml -v
# the following is used to start the Hirefire endpoint.
web: thin -p $PORT start