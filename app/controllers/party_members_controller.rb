class PartyMembersController < ApplicationController
  before_action :set_requests, only: %i[index accept_request decline_request]
  before_action :set_request, only: %i[accept_request decline_request]

  def index; end

  def new
    @member = PartyMember.new
  end

  def create
    @member = PartyMember.new(party_id: params[:party_id], user_id: current_user.id)

    redirect_to parties_path if @member.save
  end

  def edit; end

  def accept_request
    @request.accept_request
    @requests = PartyMember.where(party_id: params[:party_id]).where(status: :request).where(role: :free)
    render :index
  end

  def decline_request
    @request.decline_request
  end

  private

  def set_requests
    @requests = PartyMember.where(party_id: params[:party_id]).where(status: :request).where(role: :free)
  end

  def set_request
    @request = PartyMember.find(params[:party_member_id])
  end
end
