require './classes'

playing = true

game = Game.new

while playing

  game.play
  puts "Your score is: #{game.check_game.to_s}"
  puts "Would you like to play again?"

  answer = gets.chomp

  if answer == "yes"

    if game.check_game > -2
      puts "Let's play again!"
      next

    else
       playing = false
      puts "Sorry game over!"
    end

  else
    playing = false
    puts "Your final score is: #{game.check_game.to_s}"

  end

end