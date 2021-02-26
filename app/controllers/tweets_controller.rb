class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_index_path
    else
      render new_tweet_path
    end
  end
  
  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end
  
  def update
    @tweet = Tweet.find_by(id: params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_index_path
    end
  end

  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    if @tweet.destroy
      redirect_to tweets_index_path
    end
  end
  
  
  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
