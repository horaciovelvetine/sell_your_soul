ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)


require './app/controllers/application_controller'
# require_all 'controllers'
# require_all 'models'
# require_all 'views'
