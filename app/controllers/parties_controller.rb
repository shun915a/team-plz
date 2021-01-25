class PartiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_party, only: %i[show edit update destroy]
  before_action :user_id_check, only: %i[edit destroy]
  before_action :search_party, only: %i[index]

  def index
    # @parties = Party.order('created_at DESC').limit(24)
    @q = Party.ransack(params[:q])
    @parties = @q.result(distinct: true).order('created_at DESC')
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)

    if @party.save
      redirect_to parties_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @party.update(party_params)
      redirect_to party_path(@party)
    else
      render :edit
    end
  end

  def destroy
    redirect_to parties_path if @party.destroy
  end

  private

  def user_id_check
    redirect_to root_path unless current_user.id == @party.user_id
  end

  def set_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(
      :party_title,
      :party_game_id,
      :party_text,
      party_tag_ids: []
    ).merge(user_id: current_user.id)
  end

  def search_party
    @q = Party.ransack(params[:q]) # 検索オブジェクトを生成
  end
end
