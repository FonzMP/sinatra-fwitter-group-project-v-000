require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set_session_secret
  end



  get '/' do
    erb :index
  end

  get '/tweets' do
    @tweets = Tweet.all

    erb :"tweets/tweets"
  end

end
