class UsersController < ApplicationController
  before_action :set_user, only: %i[  show edit create destroy ]

  def index
    @users = User.all
  end

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
    @users = User.all
  end


  def edit
  end

  def create
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
