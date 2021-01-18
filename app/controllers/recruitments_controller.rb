class RecruitmentsController < ApplicationController
  def index
    @friends = Friend.order('created_at DESC').limit(6)
    @parties = Party.order('created_at DESC').limit(6)
    @teams = Team.order('created_at DESC').limit(6)
    @scouts = Scout.order('created_at DESC').limit(6)
  end
end
