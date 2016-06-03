# sinatra-redis-server

Sinatra app to serve index.html page from Redis and assets from public folder

    bundle install
    bundle exec rackup -E production -p 4567 -s thin -D

Or in development

    bundle exec rackup -p 4567 -s thin

If needed, pass in a Redis url (as ENV var)

    REDIS_URL='redis://localhost:6379' && bundle exec rackup -E production -p 4567 -s thin -D

A log file is generated at /logs/sinatra.log

## Configure your app

In `app.rb` set the name of the app (See your Ember.js app's package.json file)

    project = "my-app"

## Links

- [lightning-strategy-examples/#example-sinatra-app]

[lightning-strategy-examples/#example-sinatra-app]: http://ember-cli-deploy.github.io/ember-cli-deploy/docs/v0.6.x/lightning-strategy-examples/#example-sinatra-app
