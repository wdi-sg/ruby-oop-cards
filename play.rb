require './game'
require './cards'

game = Game.new()
puts "Please enter your name: "
input = gets.chomp
while game.score > -2
  game.gamePlay
  puts "hello #{input}, your current score is #{game.score}"
  puts "Would you like to continue the game? (Y/N)"
  ans = gets.chomp
  if ans == "Y"
    next
  elsif ans == "N"
    puts "Thanks for playing! Your final score is #{game.score}"
    break
  else
    puts "Invalid reply, BYE!"
    break
  end
  # puts "hello #{input}, you have #{game.score} points."
end
