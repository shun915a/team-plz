class FriendsController < ApplicationController
  def index
    @friends = Friend.order('created_at DESC')
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
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
