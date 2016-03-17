class Player < ActiveRecord::Base
  has_many :games
  validates :name, length: {minimum: 3}

  def update_score!
    winner = Game.last.winner
    loser = Game.last.loser
    self.where(name: winner).increment(:wins)
    self.where(name: loser).decrement(:losses)
  end
end
