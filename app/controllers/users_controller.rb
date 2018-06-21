class UsersController < ApplicationController

  get '/signup' do
    if current_user == nil
        erb :"users/create_user"
    else
      redirect '/tweets'
    end
  end

  post '/signup' do

    @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do

  end

  helpers do

    def current_user
      if session.include?(:user_id)
        @user ||= User.find(session[:user_id])
      end
    end

    def create_user
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    end

  end


end
