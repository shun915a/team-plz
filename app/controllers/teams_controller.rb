class TeamsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index; end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  private

  # myteam_id は new action を作成後設定
  def team_params
    params.require(:team).permit(
      :myteam_id,
      :team_title,
      :team_game_id,
      :team_text
    ).merge(user_id: current_user.id, myteam_id: 1)
  end
end
