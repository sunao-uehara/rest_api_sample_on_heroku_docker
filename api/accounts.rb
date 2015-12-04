require_relative 'base'

module API
  class Account < Base

    BASE_PATH = '/accounts'

    namespace BASE_PATH do

      # get user info
      get '/?' do
        res = {:msg => "get account info"}
        success_response(res)
      end

      # register
      post '/?' do
        res = {:msg => "new account created"}
        success_response(res)
      end

      # login
      post '/login' do
        res = {:msg => "login successful"}
        success_response(res)
      end

      # logout
      delete '/login' do
        res = {:msg => "logout.."}
        success_response(res)
      end

      # add nickname
      put '/nickname' do
        res = {:msg => "nickname created"}
        success_response(res)
      end

      # change password
      put '/password' do
        res = {:msg => "passwd has been changed"}
        success_response(res)
      end

      # delete account
      delete '/' do
        res = {:msg => "account deleted"}
        success_response(res)
      end

    end

  end
end