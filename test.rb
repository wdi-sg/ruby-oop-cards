require 'byebug'

# playerOneScore = 0
# playerTwoScore = 0

# put = 1.times.map{ Random.rand(52) }

# puts put

# if (put[0] >= put[1])
#   playerOneScore += 1
#   puts "Player One + 1"


#   elsif (put[0] <= put[1])
#     playerTwoScore += 1
#     puts "Player Two + 1"

# end

# puts "SCORE: Player1 = #{playerOneScore}, player2 = #{playerTwoScore}"


#Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.

class Cards
attr_accessor :cards

  def initialize
    @cards = Array.new(52) {|i| i+1 }
  end

  def shuffle_cards
    @cards.shuffle
  end

  def draw_card
    @cards.pop
  end

end


byebug
puts "end"

#Create a game class that uses the card class to play a game.

class Game
  def initialize
    @deck = Cards.new.cards.shuffle
    @score = 0
    @hands = []
  end

  def play
    user_hand = @deck.draw_card
    house_hand = @deck.draw_card

    @hands << [user_hand, house_hand]

    if user_hand > house_hand
      @score += 1
    else
      @score -= 1
    end
  end

  def check_game
    @score
  end

end






