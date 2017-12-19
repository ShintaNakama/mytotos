class PagesController < ApplicationController
  def index

  end
  
  def show
    @games = Game.where(status: :TIMED)
  end
  
end
