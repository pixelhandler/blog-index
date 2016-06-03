require 'sinatra'
require 'redis'

set :public_folder, 'public'

get '/*' do
  content_type 'text/html'
  get_html(params[:revision_key])
end

def get_html(revision_key)
  redis = store
  project = "my-app" # name from ember app's package.json file
  revision_key = params[:revision_key] || redis.get("#{project}:index:current")
  redis.get("#{project}:index:#{revision_key}")
end

def store
  if ENV['REDIS_URL'].nil? || ENV['REDIS_URL'].empty?
    redis = Redis.new()
  else
    if !ENV['REDIS_SECRET'].nil?
      redis = Redis.new(:url => ENV['REDIS_URL'], :password => ENV['REDIS_SECRET'])
    else
      redis = Redis.new(:url => ENV['REDIS_URL'])
    end
  end
end
