require './game'
require './cards'

playing = true

game = Game.new

while playing
  game.play
  puts "Your name, please"
  answer = gets.chomp
  puts "Hello+ #{answer} + . Your current score is : #{game.check_game.to_s} points"

  # puts "current score is: #{game.check_game.to_s}"

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
