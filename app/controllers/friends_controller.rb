class FriendsController < ApplicationController
  # ログインしていないユーザーをログインページへ遷移
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_friend, only: %i[show edit update destroy]
  before_action :user_id_check, only: %i[edit destroy]
  before_action :search_friend, only: %i[index search]

  def index
    @friends = Friend.order('created_at DESC').limit(24)
    set_friend_column
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

  def search
    @results = @p.result.includes(:category)
  end

  private

  def user_id_check
    redirect_to root_path unless current_user.id == @friend.user_id
  end

  def set_friend
    @friend = Friend.find(params[:id])
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
    @p = Friend.ransack(params[:q]) # 検索オブジェクトを生成
  end

  def set_friend_column
    @product_name = Friend.select('friend_title').distinct  # 重複なくnameカラムのデータを取り出す
  end
end
