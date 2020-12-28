class MyteamsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_myteam, only: %i[show edit update destroy]
  before_action :user_id_check, only: %i[edit destroy]

  def new
    @myteam = Myteam.new
  end

  def create
    @myteam = Myteam.new(myteam_params)

    if @myteam.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @myteam.update(myteam_params)
      redirect_to myteam_path(@myteam)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @myteam.destroy
  end

  private

  def user_id_check
    redirect_to root_path unless current_user.id == @myteam.user_id
  end

  def set_myteam
    @myteam = Myteam.find(params[:id])
  end

  def myteam_params
    params.require(:myteam).permit(:team_name, :team_profile).merge(user_id: current_user.id)
  end
end
