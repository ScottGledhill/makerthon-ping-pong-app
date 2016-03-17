class Game < ActiveRecord::Base
  has_many :players
  after_save :update_player



  def update_player
    Player.update_results(winner, loser)

    # winner_id = Player.find_by(name:winner).id
    # Player.increment_counter(:wins, winner_id)
  end

  # def update_losses
  #   loser_id = Player.find_by(name:loser).id
  #   Player.increment_counter(:losses, loser_id)
  # e

  # feature envy
  # nd
end
