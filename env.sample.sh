# you can run:
# $ . ./env.sample.sh
# to use these variables.
export REDIS_URL='redis://localhost:6379'
export SENDGRID_PASSWORD=''
export SENDGRID_USERNAME=''
export MONGODB_URL=mongodb://localhost:27017:mailcannon_development
export MAILCANNON_ENV=development

mv config/mongoid.sample.yml config/mongoid.yml
mv config/sidekiq.sample.yml config/sidekiq.yml
mv config/mailcannon.sample.yml config/mailcannon.yml
cat env.sample.sh | grep "export\s" > env.sh
chmod +x env.sh
