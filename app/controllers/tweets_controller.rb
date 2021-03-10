class TweetsController < ApplicationController
  def index
    @user = User.where(:id => params[:user_id]).first
    @tweet = @user.tweets.all
  end

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @user.tweets.new(tweet_params)
    if @user.save
      redirect_to user_tweets_path
    else
      render new_user_tweet_path(@user)
    end
  end
  
  def show
    @user = User.find_by(id: params[:user_id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @tweet = Tweet.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:user_id])
    if @user.tweets.update(tweet_params)
      redirect_to user_tweets_path
    end
  end

  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    if @tweet.destroy
      redirect_to user_tweets_path
    end
  end
  
  
  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
