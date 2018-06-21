class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :"tweets/create_tweet"
  end

  post '/tweets' do
    @tweet = Tweet.create(content: params[:tweet][:content], user_id: session[:user_id])

    redirect '/tweets'
  end

  get '/tweets' do
    @tweets = Tweet.all

    erb :"tweets/tweets"
  end

end
