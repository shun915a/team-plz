class RecruitmentsController < ApplicationController
  def index
    @friends = Friend.order('created_at DESC').limit(5)
    @parties = Party.order('created_at DESC').limit(5)
    @teams = Team.order('created_at DESC').limit(5)
    @scouts = Scout.order('created_at DESC').limit(5)
  end
end
