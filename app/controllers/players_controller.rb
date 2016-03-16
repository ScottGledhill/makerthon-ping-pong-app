class PlayersController < ApplicationController

  def index
    players = Player.all
    p players
  end

  def show

  end


end
