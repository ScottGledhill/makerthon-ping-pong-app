class Player < ActiveRecord::Base
  has_many :games
  validates :name, length: {minimum: 3}

  def self.update_wins!
    winner = Game.last.winner
    where(name: winner).increment_counter(:wins, 1)
  end

  def self.update_losses!
    loser = Game.last.loser
    byebug
    where(name: loser).increment_counter(:losses, 1)
  end
end
