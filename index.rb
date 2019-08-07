# Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.
deck = []
class Cards
  def initialize (deck)
    increment = 1
    for i in 1..52 do
      # p i
      deck << i
      i += increment
    end
  end
end



# Create a game class that uses the card class to play a game.
# when you play the game, draw two cards from the deck.
class Game
  def initialize (deck)
    @deck = deck
    @draws = nil
    @pick = nil
    @pickhistory = []
    @discard = nil
    @discardhistory = []
  end

  def draw
    @draws = @deck.sample(2)
  end

  def pick (cardNumber)
    @pick = @draws[cardNumber-1]
    @draws.delete_at(cardNumber - 1)
    @discard = @draws[0]
    @discardhistory << @discard
    @pick
  end

  def score (points)
    if @pick > @discard
      points += 1
    else
      points -= 1
    end
  end

end

Cards.new(deck)
game = Game.new(deck)
points = 0

p 'draw:'
p draw = game.draw
p 'pick:'
p pick = game.pick(1)
p 'score:'
p score = game.score(points)



# if the player has the highest card, give them a point.
# if the player doesn't have the highest card, deduct a point.
# if the player's score is less than -2, end the game.
# Inside the game class, keep a record of each hand played in an instance variable array.

# show the score to the player