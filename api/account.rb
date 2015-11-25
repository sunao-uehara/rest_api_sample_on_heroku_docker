require_relative 'base'

module API
  class Account < Base

    BASE_PATH = '/account'

    namespace BASE_PATH do

      # get user info
      get '/?' do
        res = {:msg => "get account info"}
        success_response(res)
      end

      # register
      post '/?' do
      end

      # login
      post '/login' do
      end

      # logout
      delete '/login' do
      end

      # add nickname
      put '/nickname' do
      end

      # change password
      put '/password' do
      end

      # delete account
      delete '/' do
      end

    end

  end
end