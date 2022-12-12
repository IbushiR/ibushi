class CommentsController < ApplicationController
  before_action :set_tweet, only: %i[ new create ]

  def new
    @comment = @tweet.comments.build
  end

  def create
    @comment = @tweet.comments.build(user: current_user, content: comment_params[:content])
    if @comment.save
      redirect_to tweet_url(@tweet)
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
