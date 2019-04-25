require './game'
require './cards'

continue = true

game = Game.new

player_name = gets.chomp

while continue



  game.play_game
  puts "Hi #{player_name}! your current score is: #{game.check_score.to_s} points"
  if game.check_score < -2
      continue = false
      break
    end
  puts "do you still want to play the game?"
  answer = gets.chomp

  if continue == true && answer == "N"

    puts "player folds and his final score is: #{game.check_score.to_s}"
    continue = false
  elsif continue == true && answer == "Y"

    puts "player continues game"
  end

end