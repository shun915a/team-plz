class FriendsController < ApplicationController
  # ログインしていないユーザーをログインページへ遷移
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_friend, only: %i[show edit update destroy]
  before_action :user_id_check, only: %i[edit destroy]
  before_action :search_friend, only: %i[index]

  def index
    # @friends = Friend.order('created_at DESC').limit(24)
    @q = Friend.ransack(params[:q])
    @friends = @q.result(distinct: true).order('created_at DESC').page(params[:page]).per(12)
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

  def edit; end

  def update
    if @friend.update(friend_params)
      redirect_to friend_path(@friend)
    else
      render :edit
    end
  end

  def destroy
    redirect_to friends_path if @friend.destroy
  end

  private

  def user_id_check
    redirect_to root_path unless current_user.id == @friend.user_id
  end

  def set_friend
    @friend = Friend.find(params[:id]) unless params[:id] == search
  end

  def friend_params
    params.require(:friend).permit(
      :friend_title,
      :friend_game_id,
      :friend_text,
      friend_tag_ids: []
    ).merge(user_id: current_user.id)
  end

  def search_friend
    @q = Friend.ransack(params[:q]) # 検索オブジェクトを生成
  end
end
