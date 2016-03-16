class PlayersController < ApplicationController

  def index
    render json: Player.all
  end

  def show
    # api = RestClient.get(https://slack.com/api/usersdw.list)
  end
end
