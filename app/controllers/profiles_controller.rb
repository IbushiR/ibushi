class ProfilesController < BaseController
  before_action :set_profile, only: %i[ show edit update ]

  def show
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to profiles_url(@user)
    else
      render :edit, status: :unprocessble_entity
    end
  end

  private
  def set_profile
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:name, :email, :description, :avatar)
  end

end


