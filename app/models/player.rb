class Player < ActiveRecord::Base
  has_many :games
  validates :name, length: {minimum: 3}

  # def update_score!
  #   self.update_column(:wins, self.game += 1)
  #   self.update_column(:losses, self.game += 1)
  # end
end
