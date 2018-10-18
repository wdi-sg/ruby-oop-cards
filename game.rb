# Create a deck and play the game.
class Game
  attr_reader :score

  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []
  end

  def play
    house_hand = @deck.draw
    player_hand = @deck.draw
    @hands << [house_hand, player_hand]
    @score += 1 if house_hand < player_hand
    @score -= 1 if house_hand > player_hand
    puts "House hand: #{house_hand}."
    puts "Your hand: #{player_hand}"
  end

  def number_of_cards
    @deck.amount
  end
end
