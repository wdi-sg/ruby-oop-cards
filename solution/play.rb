require './game'
require './cards'

playing = true

game = Game.new
# cards = Cards.new

while playing

  game.play

  puts "do you want to play this hand?"
  answer = gets.downcase.chomp

  if answer == "no"
    puts "folding"
    next
  end

  game.show

  puts "current score is: #{game.check_game.to_s}"

  puts

  if game.check_game < -2
    playing = false
  end
end
