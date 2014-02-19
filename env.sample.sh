# you can run:
# $ . ./env.sample.sh
# to use these variables.
export REDIS_URL='redis://localhost:6379'
export SENDGRID_PASSWORD=''
export SENDGRID_USERNAME=''
export MONGODB_URL=mongodb://localhost:27017/mailcannon_development
export MAILCANNON_ENV=development
#export LIBRATO_SOURCE=development
#export LIBRATO_TOKEN=thatoken
#export LIBRATO_USER=thauser

cp config/mongoid.sample.yml config/mongoid.yml
cp config/sidekiq.sample.yml config/sidekiq.yml
cp config/mailcannon.sample.yml config/mailcannon.yml
cat env.sample.sh | grep "export\s" > env.sh
chmod +x env.sh
