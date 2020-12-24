class DesksController < ApplicationController
  before_action :set_user, only: %i[new create]

  def new
    @desk = Desk.new
  end

  def create
    if Desk.exists?(user_id: @user.id)
      redirect_to root_path
    else

      @desk = Desk.new(desk_params)
      if @desk.save
        redirect_to user_path(@desk.user_id)
      else
        render :new
      end

    end
  end

  def destroy
    @desk = Desk.find_by(user_id: params[:id])
    redirect_to root_path unless current_user.id == @desk.user_id
    redirect_to user_path if @desk.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def desk_params
    params.require(:desk).permit(:image, :desk_text).merge(user_id: current_user.id)
  end
end
