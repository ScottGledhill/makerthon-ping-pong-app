class PlayersController < ApplicationController

  def index
    @player = render json: Player.select('name')
  end

end
