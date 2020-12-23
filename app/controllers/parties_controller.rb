class PartiesController < ApplicationController
  def index
    @parties = Party.order('created_at DESC')
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

  private

  def set_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(
      :party_title,
      :party_game_id,
      :party_text
    ).merge(user_id: current_user.id)
  end
end
