class Player < ActiveRecord::Base
  has_many :games
  validates :name, length: {minimum: 3}

  def self.update_results(winner, loser)
    byebug
    winner_id = Player.find_by(name: winner).id
    Player.increment_counter(:wins, winner_id)
    loser_id = Player.find_by(name: loser).id
    Player.increment_counter(:losses, loser_id)
  end
  # def self.update_wins!
  #   winner = Game.last.winner
  #   Player.where(name: winner).increment_counter(:wins, 1)
  # end
  #
  # def self.update_losses!
  #   loser = Game.last.loser
  #   Player.where(name: loser).increment_counter(:losses, 1)
  # end
end
