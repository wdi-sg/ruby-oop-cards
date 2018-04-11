
# Create card class
class Cards
  attr_accessor :cards

  def initialize
    @cards = []
    52.times do |number|
      @cards << (number +   1)
    end
  end

  def show_card
    @cards.shuffle.first
  end

  def get_card
    @cards.shuffle.pop
  end

  def show_deck
    @cards
  end

  def delete(card)
    @cards.delete(card) { "card not found" }
  end
end

class Game
  attr_accessor :deck

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @deck = Cards.new
    @played_cards = []
  end

  def play
    # Player to draw a card, drawed card will be saved into the played_cards array
    puts "Drawing card for player 1..."
    @player1.current_card = @deck.show_card
    puts "Player 1 current card => #{@player1.current_card}"
    @played_cards << @player1.current_card
    # Remove drawed card from the deck
    @deck.delete(@player1.current_card)

    # House to draw a card, drawed card
    puts "Drawing card for player 2..."
    @player2.current_card = @deck.show_card
    puts "Player 2 current card => #{@player2.current_card}"
    @played_cards << @player2.current_card
    # Remove drawed card from the deck
    @deck.delete(@player2.current_card)

    puts "Checking for value of cards for both players..."
    if @player1.current_card > @player2.current_card
      @player1.score += 1
      @player2.score -= 1
    else
      @player2.score += 1
      @player1.score -= 1
    end
  end

  def check_score
    if @player1.score < -2
      return "p2_win"
    end

    if @player2.score < -2
      return "p1_win"
    end
  end

  def check_deck_size
    if @deck.show_deck.size == 0
      puts "Deck is empty, end the game..."
      return true
    end
    return false
  end
end

class Player
  attr_accessor :name, :score, :current_card

  def initialize(name)
    @name = name
    @current_card = nil
    @score = 0
  end
end

playing = true

# Get the player's name and create instances for each of them
puts "Enter player 1 name: "
player1_name = gets.chomp
player1 = Player.new(player1_name)

puts "Enter player 2 name: "
player2_name = gets.chomp
player2 = Player.new(player2_name)

# Create new instance of game
game = Game.new(player1, player2)

while playing
  puts "\nContinue playing? [Y/N]..."
  continue = gets.chomp

  if continue == 'Y' || continue == 'y'
    puts "\nDeck size => #{game.deck.show_deck.size}"

    # End the game when one of the player's score becomes less than -2
    if game.check_score == "p1_win"
      puts "\n#{player1.name} has won the game"
      puts "#{player1.name} has a total score of #{player1.score}"
      puts "#{player2.name} has a total score of #{player2.score}"
      playing = false
      break
    end

    # End the game when one of the player's score becomes less than -2
    if game.check_score == "p2_win"
      puts "\n#{player2.name} has won the game"
      puts "#{player1.name} has a total score of #{player1.score}"
      puts "#{player2.name} has a total score of #{player2.score}"
      playing = false
      break
    end

    # End the game if the deck becomes empty
    if game.check_deck_size
      puts "Game Over, deck has become empty..."
      playing = false
      break
    end

    # Continue on with the game
    game.play
  else
    puts "\nEnding game..."
    puts "#{player1.name} has a total score of #{player1.score}"
    puts "#{player2.name} has a total score of #{player2.score}"
    break
  end
end
