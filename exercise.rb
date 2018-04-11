require 'pp'
# Create a game of cards using ruby objects.

# Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.
class Cards

  attr_accessor :cards

  def initialize
    @cards = []
    (1..52).each do |x|
      @cards.push(x)
    end
  end

  def drawCard
    @cards.delete_at(rand(0..numCardsRemaining-1))
  end

  def numCardsRemaining
    @cards.length
  end

end

# Create a game class that uses the card class to play a game.
class Game
  attr_accessor :gameCards, :points, :cardsPlayed

  def initialize
    @gameCards = Cards.new
    @points = 0
    @cardsPlayed = []
  end

  def playRound(bet)
    playerCard = @gameCards.drawCard
    compCard = @gameCards.drawCard

    # Inside the game class, keep a record of each hand played in an instance variable array.
    cardsPlayed.push(playerCard)
    cardsPlayed.push(compCard)
    puts "player card: #{playerCard}"
    puts "computer card: #{compCard}"

    # if the player has the highest card, give them a point.
    if playerCard > compCard
      puts "Player won!"
      @points += 1 + bet.to_i
    # if the player doesn't have the highest card, deduct a point.
    else
      puts "Player lost!"
      @points -= 1 - bet.to_i
    end
  end

end

# when you play the game, draw two cards from the deck.
# --- initalize cards and game
game = Game.new
playing = true

# Ask the player for their name at the beggining of the game, and print it out at each turn. Example: "hello Ray, you have 10 points."
puts "What is your name?"
name = gets.chomp

while playing

  # Implement betting inside the game class. Before each turn allow the user to make a wager from his current points.
  puts "#{name}, how much do you want to bet for this round?"
  bet = gets.chomp

  game.playRound(bet)
  puts "#{name}, your score for this round: #{game.points}"

  # On each turn, ask the player if he wants to continue with the game. If he says no, end the game and output the final score.
  puts "Do you want to continue? (y/n)"
  answer = gets.chomp
  if answer === 'n'
    puts "Goodbye #{name}. Your total score is #{game.points}"
    playing = false
  end

  # if the player's score is less than -2, end the game.
  if game.points < -2
    # show the score to the player
    puts "Game over #{name}. Your total score is #{game.points}"
    playing = false
  end
end

# further
# Change the card class to reflect an actual deck of cards. You can choose to make each card a class instance if you want. You will have to change the winning card logic. You can use these rules: https://en.wikipedia.org/wiki/High_card_by_suit
#
# further
# Implement a blackjack game.
