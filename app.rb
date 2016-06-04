require 'sinatra'
require 'redis'

set :public_folder, 'public'

get '/*' do
  content_type 'text/html'
  get_html(params[:revision_key])
end

def get_html(revision_key)
  redis = store
  project = "overlord"
  revision_key = params[:revision_key] || redis.get("#{project}:index:current")
  redis.get("#{project}:index:#{revision_key}")
end

def store
  if ENV['REDIS_URL'].nil? || ENV['REDIS_URL'].empty?
    redis = Redis.new()
  else
    # ENV['REDIS_URL'] needs 'redis://api.mwwondemand.com:6379/12' on prod
    redis = Redis.new(:url => ENV['REDIS_URL']) # :password => ENV['REDIS_SECRET']
  end
end
