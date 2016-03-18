player_list = [
  [ "Zeshan", 0,0,0 ],
  [ "Hannah", 0,0,0 ],
  [ "Scott", 0,0,0 ],
  [ "Mo", 0,0,0 ],
  [ "Arnold", 0,0,0 ],
  [ "Rufus", 0,0,0 ],
  [ "Rachel", 0,0,0 ],
  [ "Sean", 0,0,0 ],
  [ "Constantin", 0,0,0 ],
  [ "Marcus", 0,0,0 ],
]

player_list.each do |name, wins, losses, win_percentage|
  Player.create( name: name, wins: wins, losses: losses, win_percentage: win_percentage)
end
