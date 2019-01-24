require './game'

point = 10
ans = "yes"

puts "Currently you have 10 points for the card game."

while point > -2 && ans == "yes"
  puts "Do you want to play card game? (yes or no)"
  ans = gets.chomp
  if ans == "yes"
    game = Game.new(point)
    point = game.new_Game
    puts "You have " + point.to_s + " points."
  elsif ans == "no"
    puts "Thank you for playing"
  else
    ans = "yes"
  end
end