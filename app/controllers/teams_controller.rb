class TeamsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_team, only: %i[show edit update destroy]
  before_action :user_id_check, only: %i[edit destroy]

  def index
    @teams = Team.order('created_at DESC')
  end

  def new
    @team = Team.new
  end

  def create
    redirect_to teams_path if current_user.id != Myteam.find(params[:team][:myteam_id]).user_id
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  private

  def user_id_check
    redirect_to root_path unless current_user.id == @team.user_id
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(
      :myteam_id,
      :team_title,
      :team_game_id,
      :team_text,
      team_tag_ids: []
    ).merge(user_id: current_user.id, myteam_id: params[:team][:myteam_id])
  end
end
