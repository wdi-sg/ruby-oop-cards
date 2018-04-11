require './game'
require './cards'

playing = true

game = Game.new

while playing == true do
  # puts "Enter your name:"
  # player_name = gets.chomp

  # puts "Welcome to card game, #{player_name}."

  game.play
  puts "Your current hand is #{game.check_player_cards.to_s}"
  puts "House hand is #{game.check_house_cards.to_s}"

  puts "Do you want to play this round?"
  puts "Your current score is #{game.check_player_score}"
  answer = gets.chomp

  if answer == "no"
    puts "Skipping this round"
    next
  end

  if game.check_player_score < -2
    puts "You have lost. Game over"
    playing = false
  end
end