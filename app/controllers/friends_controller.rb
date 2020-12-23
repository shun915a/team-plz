class FriendsController < ApplicationController
  # ログインしていないユーザーをログインページへ遷移
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_friend, only: %i[show edit update destroy]

  def index
    @friends = Friend.order('created_at DESC')
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      redirect_to friends_path
    else
      render :new
    end
  end

  def show; end

  def edit
    redirect_to root_path unless current_user.id == @friend.user_id
  end

  def update
    if @friend.update(friend_params)
      redirect_to friend_path(@friend)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path unless current_user.id == @friend.user_id
    redirect_to friends_path if @friend.destroy
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(
      :friend_title,
      :friend_game_id,
      :friend_text
    ).merge(user_id: current_user.id)
  end
end
