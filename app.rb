require 'sinatra'
require 'redis'

def bootstrap_index(index_key)
  redis = Redis.new(:password => "#{ENV['REDIS_SECRET']}")
  project = "pixelhandler-blog"
  index_key ||= redis.get("#{project}:index:current")
  redis.get("#{project}:index:#{index_key}")
end

get '/*' do
  content_type 'text/html'
  bootstrap_index(params[:index_key])
end
