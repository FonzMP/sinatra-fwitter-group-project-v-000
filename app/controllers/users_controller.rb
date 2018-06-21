class UsersController < ApplicationController

  get '/signup' do
    current_user
    if @user
      redirect '/tweets'
    else
      binding.pry
      erb :"users/create_user"
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
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
    @user = User.find_by(username: params[:username], email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect 'users/show'
    else
      redirect '/login'
    end
  end

  helpers do

    def current_user
      @user = User.find(session[:user_id])
    end

  end


end
