class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    
  end

  def new
    @user = User.find(current_user.id)
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params_comment)
    if @comment.save
      redirect_to tweet_url(@tweet)
    else
      render :new, status: :unprocessable_entity
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
  def set_comment
    @user = User.find(current_user.id)
    @tweet = Tweet.find(params[:id])
  end

  def params_comment
    params.require(:comment).permit(:content)
  end

end
