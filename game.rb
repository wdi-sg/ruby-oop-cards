require './cards'
require './setup'

playing = true

game = game.new


while player_score > -2 && computer_score > -2
  playing = true
end


while player_score < -2 || computer_score < -2
  playing = false
end




print "What is your name? "
name = gets.chomp

puts "Hi #{name.capitalize}, would you like to play a game? yes or N"
game_start = gets.chomp

if game_start == "Y"
  p "yay"
else p "neh"
end
