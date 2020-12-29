class RecruitmentsController < ApplicationController
  def index
    friends = Friend.order('created_at DESC')
    parties = Party.order('created_at DESC')
    teams = Team.order('created_at DESC')
    scouts = Scout.order('created_at DESC')

    @recruitments = friends.merge(parties).merge(teams).merge(scouts)
    binding.pry
  end
end
