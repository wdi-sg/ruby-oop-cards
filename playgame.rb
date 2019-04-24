require "./game"
require "./cards"
#implement when player = dealer
playing = true
puts "welcome to casino wars"
game = Game.new
#pulls Game.new from play.rb file
while playing
  game.play
  # puts "you have beaten the dealer"
  puts "current score is: #{game.check_game.to_s}"
  #gives score as a string from the game.rb file
  puts "do you want to play this hand?"

  # if answer == "yes"

  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  end

  if game.check_game < -1
    playing = false
  end
  #check if game is score is less than -2 if statement is true game ends.
end
