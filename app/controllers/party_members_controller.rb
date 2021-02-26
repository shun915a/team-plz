class PartyMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_request, only: %i[new create]
  before_action :check_author, only: %i[accept_request decline_request]
  before_action :set_requests, only: %i[index accept_request decline_request]
  before_action :set_request, only: %i[accept_request decline_request]

  def index
    redirect_to root_path unless current_user.id == Party.find_by(id: params[:party_id]).user_id
  end

  def new
    @member = PartyMember.new
  end

  def create
    @member = PartyMember.new(party_id: params[:party_id], user_id: current_user.id)
    redirect_to parties_path if @member.save
  end

  def accept_request
    @request.accept_request
    render :index
  end

  def decline_request
    @request.decline_request
    render :index
  end

  private

  def check_author
    redirect_to root_path unless current_user.id == Party.find(params[:party_id]).user_id
  end

  def check_request
    redirect_to root_path if PartyMember.where(party_id: [:party_id]).where(user_id: current_user.id).exists?
  end

  def set_requests
    @requests = PartyMember.where(party_id: params[:party_id]).where(status: :request).where(role: :free)
  end

  def set_request
    @request = PartyMember.find(params[:party_member_id])
  end
end
