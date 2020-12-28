class TeamsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index; end
end
