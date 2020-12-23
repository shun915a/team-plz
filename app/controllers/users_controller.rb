class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_user, only: %i[show edit update destroy]

  def show
    @user = User.find(params[:id])
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end

  def update
    binding.pry
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :gender_id,
      :birthday,
      :twitter_name,
      :twitch_name,
      :mildom_name,
      :profile
    )
  end

  protected

  def update_resource(_resource, params)
    @user.update_without_password(params)
  end
end
