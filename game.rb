require_relative 'cards'
require_relative 'engine'

print "What's your name? "
player_name = gets.chomp
player_name = player_name.capitalize!

game = Game.new(player_name)

play = true

while play == true

  game.play_round

  puts "#{player_name}'s score is: #{game.check_score.to_s}"

  if game.check_score < -2
    puts "Game Over!"
    play = false
  end

  print "do you want to continue? (yes/no)"
  continue = gets.chomp

  if continue == "no"
    play = false
  end

end