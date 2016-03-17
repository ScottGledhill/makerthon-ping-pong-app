class PlayersController < ApplicationController

  def index
    @player = render json: Player.all.order(:win_percentage)
  end

end
