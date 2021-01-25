class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_user, only: %i[show edit update destroy]

  def show
    @user = User.find(params[:id])
    @desk = Desk.find_by(user_id: @user.id)
    @myteams = Myteam.where(user_id: @user.id).order('created_at DESC')
    @friends = Friend.where(user_id: @user.id).order('created_at DESC')
    @parties = Party.where(user_id: @user.id).order('created_at DESC')
    @teams = Team.where(user_id: @user.id).order('created_at DESC')
    @scouts = Scout.where(user_id: @user.id).order('created_at DESC')
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end

  def update
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
