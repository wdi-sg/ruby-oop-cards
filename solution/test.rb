require './game'
require './cards'

playing = false

game = Game.new
puts "Player vs Ai. Draw one of 52 card each per turn. Highest points wins the round. Lose when points = -3"
puts "Start the game? yes/no"
start_game = gets.chomp
if start_game == "yes"
  playing = true
end

while playing

  puts "Draw card from the deck? Typing no will exit. (yes/no)"
  draw_card = gets.chomp
  if draw_card == "no"
    game.lose
    playing = false
    next
  end

  if draw_card == "yes"
    game.draw_cards
    puts "current hand is: #{game.check_hand.to_s}"
  end

  puts "Play or fold current hand? Folding will lose you 0.5 points (play/fold)"
  play_hand = gets.chomp
  if play_hand == "fold"
    game.fold
    playing = false
  end

  if play_hand == "play"
    game.play_hand
    puts "Your current score is: #{game.check_game.to_s}"
    playing = false
  end

  if game.check_game < -2
    game.lose
    playing = false
  end

  puts "End of round..."
end

while playing
  
end


  # if play_hand == "fold"




  # game.play

  # puts "current score is: #{game.check_game.to_s}"
  # puts "current hand is: #{game.check_hand.to_s}"
  # puts "do you want to play this hand?"

  # answer = gets.chomp
  # if answer == "no"
  #   game.fold
  #   puts "folding..."
  # end

  # if answer == "yes"
  #   puts "playing hand..."
  # end

  # if game.check_game < -2
  #   game.lose
  #   playing = false
  # end


