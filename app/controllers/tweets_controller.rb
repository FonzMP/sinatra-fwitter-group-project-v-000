class TweetsController < ApplicationController

  get '/tweets/new' do
    if !current_user
      redirect '/login'
    else
      erb :"tweets/create_tweet"
    end
  end

  post '/tweets' do
    @tweet = Tweet.create(content: params[:tweet][:content], user_id: current_user.id)

    redirect '/tweets'
  end

  get '/tweets' do
    if !current_user
      redirect '/login'
    else
    @tweets = Tweet.all

    erb :"tweets/tweets"
  end

end
