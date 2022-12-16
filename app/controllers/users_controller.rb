class UsersController < ApplicationController
  before_action :set_user, only: %i[  show edit create destroy ]

  def new
    @user = User.new
    
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to user_path(@uaer), notice: "作成"
    else
      render :new, status: :unprocessble
    end
  end
  
  def show
    @tweets = Tweet.page(params[:page]).per(5)
    @users = User.all
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

end
