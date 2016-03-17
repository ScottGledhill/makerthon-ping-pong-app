class Game < ActiveRecord::Base
  has_many :players
  # after_save :update_score
  #
  # def update_record
  #   self.player.update_score!
  # end
end
