require './game.rb'
require './cards.rb'

playing = true

game = Game.new

puts "what's your name?"
$player_name = gets.chomp

while playing

  game.play
  puts "Hi #{$player_name}, your current score is: #{game.check_game.to_s}"

  puts "Hi #{$player_name}, do you want to play this hand?"

  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  end

  puts "do you want to continue with game?"
  check = gets.chomp
  if check == "no"
    puts "Your final score is #{game.check_game.to_s}"
    playing = false
  end

  if game.check_game < -2
    playing = false
  end
end
