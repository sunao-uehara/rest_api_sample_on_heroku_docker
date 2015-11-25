require 'rack'

require_relative 'api/base'
require_relative 'api/account'

app = Rack::Builder.new do
  use API::Account
  run API::Base
end

run app
