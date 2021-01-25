class ScoutsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_scout, only: %i[show edit update destroy]
  before_action :user_id_check, only: %i[edit destroy]
  before_action :search_scout, only: %i[index]

  def index
    # @scouts = Scout.order('created_at DESC').limit(24)
    @q = Scout.ransack(params[:q])
    @scouts = @q.result(distinct: true).order('created_at DESC')
  end

  def new
    @scout = Scout.new
  end

  def create
    @scout = Scout.new(scout_params)

    if @scout.save
      redirect_to scouts_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @scout.update(scout_params)
      redirect_to scout_path(@scout)
    else
      render :edit
    end
  end

  def destroy
    redirect_to scouts_path if @scout.destroy
  end

  private

  def user_id_check
    redirect_to root_path unless current_user.id == @scout.user_id
  end

  def set_scout
    @scout = Scout.find(params[:id])
  end

  def scout_params
    params.require(:scout).permit(
      :scout_title,
      :scout_game_id,
      :scout_text,
      scout_tag_ids: []
    ).merge(user_id: current_user.id)
  end

  def search_scout
    @q = Scout.ransack(params[:q]) # 検索オブジェクトを生成
  end
end
