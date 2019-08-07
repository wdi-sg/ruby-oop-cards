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
    @points = 0
  end

  def draw
    @draws = @deck.sample(2)
    @deck -= @draws
    @draws
  end

  def pick (cardNumber)
    @pick = @draws[cardNumber-1]
    @draws.delete_at(cardNumber - 1)
    @discard = @draws[0]
    @discardhistory << @discard
    @pick
  end

  def discarded
    @discard
  end

  # def score
  #   if @pick > @discard
  #     @points += 1
  #   else
  #     @points -= 1
  #   end
  #   @points
  # end

  def score
    @points
  end

  def wagerScore (wager)
    @wager = wager
    if @pick > @discard
      @points += wager
    else
      @points -= wager
    end
    @points
  end


end




Cards.new(deck)
game = Game.new(deck)

p "Starting a new game. Tell us who you are!"
name = gets.chomp.capitalize
p "Welcome #{name}!"

turnCounter = 0
restart = false
while restart == false
  turnCounter += 1
  if turnCounter > 1 && game.score > 0
    p 'How many points would you like to wager?'
    wager = gets.chomp.to_i
  else
    p 'Disabling wager option because because player is broke'
    wager = 1
  end
  draws = game.draw
  p 'type 1 or 2 to pick a card'
  pick = game.pick(gets.chomp.to_i)
  p 'you picked '+ pick.to_s
  p "other card was: #{game.discarded}"
  p "score: #{score = game.wagerScore(wager)}"

  p "You have #{game.score} points. Type quit to stop playing, and any other key to continue!"
  if gets.chomp.to_s == 'quit'
    p "Final score: #{game.score}. Play again sometime!"
    restart = true
  end

end


# if the player has the highest card, give them a point.
# if the player doesn't have the highest card, deduct a point.
# if the player's score is less than -2, end the game.
# Inside the game class, keep a record of each hand played in an instance variable array.

# show the score to the player