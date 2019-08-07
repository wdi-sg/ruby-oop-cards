class Card

  def initialize
    @deck = (1 .. 52).to_a

  end

  def showCardArray
    puts @deck

  end

  def pickTwoCards
    @twoCards = @deck.sample(2)
    puts @twoCards
  end

end

puts "After shuffling, deck now contains: "

newCard = Card.new()

# newCard.showCardArray()

newCard.pickTwoCards()
# There are 52 cards in a standard deck.
# Each card belongs to one of four suits: Spades, Hearts, Diamonds, and Clubs.
# Each card is one of 13 ranks: Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, and King.