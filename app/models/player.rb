class Player < ActiveRecord::Base
  has_many :games
  validates :name, length: {minimum: 3}

  def self.update_results(winner, loser)
    winner_id = Player.find_by(name: winner).id
    Player.increment_counter(:wins, winner_id)
    loser_id = Player.find_by(name: loser).id
    Player.increment_counter(:losses, loser_id)
    calculate_win_percentage(winner)
    calculate_win_percentage(loser)
  end

  def self.calculate_win_percentage(player)
    wins = Player.find_by(name:player).wins
    losses = Player.find_by(name:player).losses
    Player.find_by(name: player).update_all((wins/(wins + losses)).to_f * 100).round(2)
  end
end
