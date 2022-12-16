class FavoritesController < ApplicationController
  before_action :set_tweet, only: %i[ create destroy ]

  def create
  @favorite = @tweet.favorites.build(user: current_user)
  @favorite.save
  redirect_to tweet_path(params[:tweet_id]) 
  end

  def destroy
  @favorite = @tweet.favorites.find_by(user: current_user)
  @favorite.destroy
  redirect_to tweet_path(params[:tweet_id]) 
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end