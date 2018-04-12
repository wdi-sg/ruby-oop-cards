require './game'
require './cards'

playing = true

game = Game.new

puts "Enter your name:"
player_name = gets.chomp

puts "Welcome to card game, #{player_name}."

while playing == true do
  

  game.play
  puts "Your current hand is #{game.check_player_cards.to_s}"
  puts "House hand is #{game.check_house_cards.to_s}"
  puts "Remaining cards: #{game.check_remaining_card}"

  puts "Do you want to play this round?"
  puts "Your current score is #{game.check_player_score}"
  answer = gets.chomp


  if answer == "no"
    puts "Skipping this round"
    if game.check_remaining_card <= 0
      puts "Game over. No more cards left"
      puts "Your current score is #{game.check_player_score}."
      playing = false
    end
  else
    game.compare_cards
    puts "Your current score is #{game.check_player_score}."
    if game.check_player_score < -2
      puts "Your score fell below -2. Game over"
      playing = false
    end
  end

end