class Game

  def initialize
    @cards = []
    i = 1
    loop do
      @cards << i
      i+=1
      if i > 52
        break
      end
    end
  end

  def playGame
    @cards = @cards.shuffle
    @score = 0
    playerCard = @cards[0]
    p "player drew" + playerCard.to_s
    houseCard = @cards[1]
    p "house drew" + houseCard.to_s
    if playerCard > houseCard
      @score += 1
    else
      @score -= 1
    end
    p @score
  end

  def seeDeck
    p @cards
  end

end

newGame = Game.new
newGame.seeDeck
newGame.playGame