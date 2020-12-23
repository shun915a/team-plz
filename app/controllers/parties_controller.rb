class PartiesController < ApplicationController
  def index
    @parties = Party.order('created_at DESC')
  end
end
