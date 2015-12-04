require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/config_file'
require "sinatra/cookies"
require 'sinatra/reloader'
require 'sinatra/json'

require "logger"

module API
  class Base < Sinatra::Base
    register Sinatra::Namespace
    register Sinatra::ConfigFile

    config_file '../config.yml'

    configure do
      set :logging, Logger::DEBUG
    end

    configure :development do
      register Sinatra::Reloader
    end

    before do
      # set json as default response type
      content_type :json

      # settings defined in config.yml
      logger.debug settings.foo
    end

    def self.some_class_method
      "YES!"
    end

    def success_response(data, links = nil)
      body = {
          status: 'success',
          data: data
      }
      body.merge!({links: links}) unless links.nil?

      status 200
      halt json body
    end

    def failure_response(data = nil)
      body = {
          status: 'failure',
          data: data
      }

      status 200
      halt json body
    end

    def error_response(status_code, message = nil, data = nil)
      body = {
          status: 'error',
          message: message
      }
      body.merge!({data: data}) unless data.nil?

      status status_code.to_i
      halt json body
    end

    get '/?' do
      logger.warn "somebody try accessing api root from : #{request.ip}"
      error_response(400, "Bad Request")
    end

  end
end