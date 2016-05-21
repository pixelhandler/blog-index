require 'rubygems'
require 'sinatra'

set :environment, :production #ENV['RACK_ENV'].to_sym
disable :run, :reload

root_dir = File.dirname(__FILE__)
app_file = File.join(root_dir, 'app.rb')

set :root,        root_dir
set :app_file,    app_file

require app_file

FileUtils.mkdir_p 'logs' unless File.exist?('logs')
log = File.new('logs/sinatra.log', 'a')
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
