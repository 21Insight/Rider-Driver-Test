ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

Dotenv.load if ENV['RACK_ENV'] == 'development'
