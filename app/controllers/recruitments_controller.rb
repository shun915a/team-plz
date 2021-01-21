class RecruitmentsController < ApplicationController
  def index
    @friends = Friend.order('created_at DESC').limit(4)
    @parties = Party.order('created_at DESC').limit(4)
    @teams = Team.order('created_at DESC').limit(4)
    @scouts = Scout.order('created_at DESC').limit(4)
  end
end
