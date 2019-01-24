require './game'
require './cards'

playing = true

game = Game.new
# cards = Cards.new

puts "What is your name?"
playerName = gets.chomp

while playing

  game.play

  puts "#{playerName}, do you want to play this hand?"
  answer = gets.downcase.chomp

  if answer == "no"
    puts "folding"
    next
  end

  game.show

  puts "current score is: #{game.check_game.to_s}"

  puts "#{playerName}, do you want to continue with the game?"
  answer = gets.downcase.chomp

  if answer == "no"
    playing = false
    puts "Final score is #{game.check_game}"
    next
  end

  if game.check_game < -2
    playing = false
  end
end
