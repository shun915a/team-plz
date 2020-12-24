class DesksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @desk = Desk.new
  end

  def create
    @desk = Desk.new(desk_params)

    if @desk.save
      redirect_to user_path(@desk.user_id)
    else
      render :new
    end
  end

  private

  def desk_params
    params.require(:desk).permit(:image, :desk_text).merge(user_id: current_user.id)
  end
end
