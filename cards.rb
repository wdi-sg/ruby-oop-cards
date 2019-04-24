# Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.
class Cards

  def initialize
    @cards = (1..52).to_a
  end

  def cards
    @cards
  end

  def draw_card()
    @cards.sample(2)
  end

end

# new_cards = Cards.new()
# print new_cards.cards


# Create a game class that uses the card class to play a game.

class Game

  def initialize(deck, player, dealer)
    @deck = deck
    @player = player
    @dealer = dealer
  end

  def player()
    @player
  end



end