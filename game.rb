require_relative 'cards'

class Play
  deck = Cards.new()


  print "What's your name? "
  player_name = gets.chomp
  player_name.capitalize!
  puts "Hello #{player_name}!"
  print "Do you want to play? (yes/no) "
  play = gets.chomp
  while play == "yes"
    # player draws two cards
    # if the player has the highest card, give them a point.
    # if the player doesn't have the highest card, deduct a point.
    # if the player's score is less than -2, end the game.

  end
end

# deck = Cards.new()
# p "created deck: #{deck.cards}"
# p "drawing two cards: #{deck.draw}"