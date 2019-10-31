require './game'
require './cards'

playing = true

game = Game.new

while playing

  game.play
  puts "current score is: #{game.check_game.to_s}"

  puts "do you want to play this hand?"

  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  end

  if game.check_game < -2
    playing = false
  end
end
