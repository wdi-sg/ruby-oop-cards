require './game'
require './cards'


playing = true

game = Game.new

# Ask the player for their name at the beggining of the game, and print it out at each turn. Example: "hello Ray, you have 10 points."
print "What is your name"
puts
@player_name = gets.chomp


while playing

  game.play
  # puts game.deck
  puts "#{@player_name}, your current score is: #{game.game_status}"

  puts "draw again?"

  answer = gets.chomp
  if answer == "no"
    puts "Skipped a turn"
    next
  end

  if game.game_status < -2
    playing = false
    puts "You loseeeee"
  end
end