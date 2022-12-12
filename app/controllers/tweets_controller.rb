class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to user_url(current_user)
    else
      render :new, status: :unprocessble_entity
    end    
  end

  def show
    @user = User.find(current_user.id)
    @tweet = Tweet.find(params[:id])
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
