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
    Player.find_by(name: player).update_columns(win_percentage: ((wins /(wins + losses.to_f)) * 100).round(2))
  end

  def self.add_slack_users
    uri = URI.parse("https://slack.com/api")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/users.list?token="+ENV['TOKEN']+"&pretty=1")
    response = http.request(request)
    parsed_matches = JSON.parse(response.body)["id"]
    parsed_matches.each do |key, val|
      if val != "slackbot" && !Player.exists?(val)
        Player.create(name: val, wins: 0, losses: 0, win_percentage: 0)
      end
    end
  end
end
