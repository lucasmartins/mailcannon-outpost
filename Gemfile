source 'https://rubygems.org'

ruby "2.2.2"

gem 'rake'
gem 'mailcannon', '0.3.14', git: "https://github.com/ResultadosDigitais/mailcannon"
gem 'thin'
gem 'librato-rack'
gem 'librato-sidekiq'
gem 'newrelic_rpm'
gem 'newrelic_moped'
gem 'sidekiq', '3.5.4'

# https://github.com/heroku/heroku-buildpack-ruby/issues/206
# If you have trouble with Heroku at deploy time, try this temporary fix:
# heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-ruby.git#v84 --app YOURAPP

group :developemnt do
  gem 'pry'
  gem 'pry-nav'
end
