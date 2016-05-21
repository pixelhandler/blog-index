require 'sinatra'
require 'redis'
require 'httparty'

def bootstrap_index(index_key)
  redis = Redis.new(:password => "#{ENV['REDIS_SECRET']}")
  project = "pixelhandler-blog"
  index_key ||= redis.get("#{project}:index:current")
  redis.get("#{project}:index:#{index_key}")
end

get '/sitemap.xml' do
  content_type 'text/xml'
  '<?xml version="1.0" encoding="UTF-8"?><url>sitemap.xml</url>'
  #url = 'https://s3.amazonaws.com/cdn.pixelhandler.com/sitemap.xml'
  #resp = HTTParty.get(url)
  #resp.body
end

get '/*' do
  content_type 'text/html'
  #"<!DOCTYPE html><html><head><title>Test</title></head><body><h1>Test</h1></body></html>"
  bootstrap_index(params[:index_key])
end
