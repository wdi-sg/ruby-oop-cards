class Card
  attr_accessor :cards
  def initialize
    @cards = Array (1..52)

  end  # end of initialize
end  # end of class

deck = Card.new
# p deck


class Game
  def initialize
    @deck = Card.new
  end  # end of initialize

  def deck
    @deck
  end

  def shuffle_cards
    # shuffle the cards and select the first two cards?
    deck.shuffle
  end

end  # end of class


game = Game.new
p game.shuffle_cards