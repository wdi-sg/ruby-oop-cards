require './game'
require './cards'

playing = true

game = Game.new

while playing
  game.draw
  puts "Your current picked card number: #{game.showing_user_hand.to_s}"
  puts "do you want to play this hand?"
  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  else
    puts "House's card number: #{game.showing_house_hand.to_s}"
  game.play
  puts "Your current score is: #{game.check_game.to_s}"
  end

  if game.check_game < -2
    playing = false
  end
end
