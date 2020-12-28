class MyteamsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

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

  private

  def myteam_params
    params.require(:myteam).permit(:team_name, :team_profile).merge(user_id: current_user.id)
  end
end
