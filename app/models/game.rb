class Game < ActiveRecord::Base
  has_many :players
  after_save :update_wins
  after_save :update_losses

  def update_wins
    self.players.update_wins!
  end

  def update_losses
    self.players.update_losses!
  end
end
