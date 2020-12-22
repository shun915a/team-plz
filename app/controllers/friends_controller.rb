class FriendsController < ApplicationController
  # ログインしていないユーザーをログインページへ遷移
  before_action :authenticate_user!, only: %i[new create edit update destroy]

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

  def show
    @friend = Friend.find(params[:id])
  end

  private

  def friend_params
    params.require(:friend).permit(
      :friend_title,
      :friend_game_id,
      :friend_text
    ).merge(user_id: current_user.id)
  end
end
