class UsersController < ApplicationController

  get '/signup' do
    if current_user == nil
        erb :"users/create_user"
    else
      redirect '/tweets'
    end
  end

  post '/signup' do
    create_user(params)
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
    find_user(params)
  end

  helpers do

    def current_user
      if session.include?(:user_id)
        @user ||= User.find(session[:user_id])
      end
    end

    def create_user(params)
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    end

    def find_user(params)
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
      end
    end

  end


end
