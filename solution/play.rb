require './game'
require './cards'
require 'byebug'

game = Game.new
puts "Player vs Ai. Draw one of 52 card each per turn. Highest points wins the round. Lose when points = -3"
puts "Start the game? yes/no"

def draw_phase(game)
  puts "Draw card from the deck? Typing no will exit. (yes/no)"
  draw_card = gets.chomp
  if draw_card == "no"
    game.lose
  end
  if draw_card == "yes"
    game.draw_cards
    puts "current hand is: #{game.check_hand.to_s}"
    play_phase(game)
  end
end

def play_phase(game)
  puts "Play or fold current hand? Folding will lose you 0.5 points (play/fold)"
  play_hand = gets.chomp
  if play_hand == "fold"
    game.fold
    puts "Your current score is: #{game.check_game.to_s}"
  end

  if play_hand == "play"
    game.play_hand
    puts "Your current score is: #{game.check_game.to_s}"
  end

  if game.check_game < -2
    game.lose
  end

  if game.check_game > 2
    game.win
  end

  puts "End of round..."
  draw_phase(game)
end

start_game = gets.chomp
if start_game == "yes"
  draw_phase(game)
end
  # if play_hand == "fold"


puts "wow"
  # game.play

  # puts "current score is: #{game.check_game.to_s}"
  # puts "current hand is: #{game.check_hand.to_s}"
  # puts "do you want to play this hand?"

  # answer = gets.chomp
  # if answer == "no"
  #   game.fold
  #   puts "folding..."
  #   next
  # end

  # if answer == "yes"
  #   puts "playing hand..."
  #   next
  # end

  # if game.check_game < -2
  #   game.lose
  #   playing = false
  # end


