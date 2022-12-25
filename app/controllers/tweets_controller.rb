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
    @comments = @tweet.comments.order(created_at: :desc).page(params[:page]).per(5)
  end

  def search
    @tweets = Tweet.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(5)
    @keyword = params[:keyword]
    render "search"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
