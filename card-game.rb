require 'byebug'

class Card
  # intialize cards of 1 to 53 in @cards array
  def initialize
    @cards = [*1..52]
  end

  #discard the first card after player take it
  def playcard
    @cards.shuffle.slice!(0,2)
  end
end

class Game
  # initialize game with @score = 0, @current_hand put user and comp hand
  def initialize
    @curr_deck = Card.new
    @score = 0
  end

  def start_play
    @curr_hands = []
    user = @curr_deck.playcard
    comp = @curr_deck.playcard
    @curr_hands << user << comp
  end

  def show
    puts "Comp card is #{@curr_hands[1]}"
    puts "Do you want to play this hand? #{@curr_hands[0]}"
  end

  def compute
    user_card = @curr_hands[0].reduce(:+)
    comp_card = @curr_hands[1].reduce(:+)
    if user_card > comp_card
      @score += 1
    elsif user_card < comp_card
      @score -=1
    end
  end

  def game_score
    @score
  end
end


play = true
game = Game.new

while play
  puts "Current score is #{game.game_score}"
  game.start_play
  game.show
  answer= gets.chomp

  if answer == "no"
    puts "Draw new cards"
    next
  end

  if answer == "yes"
    game.compute
  end

  if game.game_score < -2
    puts "Game over!"
    play = false
  end
end