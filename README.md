# sinatra-redis-server

Sinatra app to serve index.html page from Redis and assets from public folder.

    rackup -E production -p 4567 -s thin -D

Or in development:

    rackup -p 4567 -s thin

A log file is generated at /logs/sinatra.log

## Links

- [lightning-strategy-examples/#example-sinatra-app]

[lightning-strategy-examples/#example-sinatra-app]: http://ember-cli-deploy.github.io/ember-cli-deploy/docs/v0.6.x/lightning-strategy-examples/#example-sinatra-app
