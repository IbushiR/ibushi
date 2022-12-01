class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit ]

  def show
  end

  def edit
  end

  private
  def set_profile
    @user = User.find(current_user.id)
  end

end


