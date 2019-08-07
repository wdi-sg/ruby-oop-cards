class Card

  def initialize
    @deck = (1 .. 52).to_a
  end

  def getOneCard
    @deck.shuffle.first
  end

end

class Game

  def initialize
    @deck = Card.new
    score = 0
    cardsPlayed = []
  end

  def playGame
    user_hand = @deck.getOneCard
    house_hand = @deck.getOneCard
    puts user_hand
    puts house_hand
  end

end

newGame = Game.new()

newGame.playGame()
# newGame.pickTwoCards()
# There are 52 cards in a standard deck.
# Each card belongs to one of four suits: Spades, Hearts, Diamonds, and Clubs.
# Each card is one of 13 ranks: Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, and King.