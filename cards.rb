# Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.
class Cards

  def initialize
    @cards = (1..52).to_a
  end

  def cards
    @cards
  end

end

# new_cards = Cards.new()
# print new_cards.cards


# Create a game class that uses the card class to play a game.

class Game

  def initialize(deck, player1, player2)
    @deck = deck
    @player1 = player1
    @player2 = player2
  end

  def deck
    @deck
  end

  def draw
    @new_deck = deck.shuffle
  end

  def player1
    @player1
  end

  def player2
    @player2
  end


end