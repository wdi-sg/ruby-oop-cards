require_relative 'cards'
require_relative 'engine'

class Play

  # if the player's score is less than -2, end the game.

  # record of each hand played

  # show the score to the player
  # game ends
  # display winner and scores

end

print "What's your name? "
player_name = gets.chomp
player_name = player_name.capitalize!

game = Game.new(player_name)

game.play_round

# deck = Cards.new()
# p "created deck: #{deck.cards}"
# p "drawing two cards: #{deck.draw}"