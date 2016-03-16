class PlayersController < ApplicationController

  def index
    players = Player.all
    p players
  end

  def show
    api = RestClient.get(https://slack.com/api/usersdw.list)
  end
end
