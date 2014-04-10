source 'https://rubygems.org'

# ruby "2.1.0", :engine => "rbx", :engine_version => "2.2.1"
ruby "2.0.0"

gem 'rubysl', platform: :rbx
gem 'rake'
gem "kiqstand", '>= 1.1.0'
# gem 'mailcannon', github: 'ResultadosDigitais/mailcannon', branch: 'edge'
gem 'mailcannon', github: 'joaohornburg/mailcannon', branch: 'fix-retry-error'
gem 'thin'
gem 'librato-rack'
gem 'librato-sidekiq'

gem 'i18n' # https://github.com/airbrake/airbrake/wiki/Using-Airbrake-in-non-Rails-apps-using-Bundler
gem 'airbrake'

# https://github.com/heroku/heroku-buildpack-ruby/issues/206
# If you have trouble with Heroku at deploy time, try this temporary fix:
# heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-ruby.git#v84 --app YOURAPP

group :developemnt do
  gem 'pry'
  gem 'pry-nav'
end
