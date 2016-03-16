class GamesController < ApplicationController

  def create
    @game = Game.new(game_params)
    if Player.exists?(name: [@game.winner, @game.loser])
      @game.save
    else
      render :status => 400
    end
  end

  private

  def game_params
    params.require(:game).permit(:winner, :loser)
  end
end
