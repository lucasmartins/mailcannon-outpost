task :default => [:run]

# Runs the Sidekiq worker
task :run do
  `bundle exec sidekiq -r ./runner.rb --config=config/sidekiq.yml -v`
end