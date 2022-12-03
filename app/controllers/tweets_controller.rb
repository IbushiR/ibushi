class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @user = User.find(current_user.id)
    @tweet = @user.tweets.new
  end

  def create
    @user = User.find(current_user.id)
    @tweet = @user.tweets.new(params_tweet)
    if @tweet.save
      redirect_to user_url(@user)
    else
      render :new, status: :unprocessble_entity
    end
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def params_tweet
    params.require(:tweet).permit(:content)
  end

end
