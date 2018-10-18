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


# Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.

class Cards
attr_accessor :cards

  def initialize
    @cards = Array.new(52) {|i| i+1 }
  end

end



# Create a game class that uses the card class to play a game.

class Game
  attr_accessor :deck, :score, :hands

  def initialize
    @deck = Cards.new.cards.shuffle
    @score = 0
    @hands = []
  end

  def play
    user_hand = @deck.pop
    house_hand = @deck.pop

    @hands << [user_hand, house_hand]

    if user_hand > house_hand
      @score += 1
      puts "Your card: #{user_hand}, computer: #{house_hand}"
    else
      @score -= 1
      puts "Your card: #{user_hand}, computer: #{house_hand}"
    end
  end

  def check_game
    @score
  end

end

# Inside the game class, keep a record of each hand played in an instance variable array.
# Show the score to the player

loop do
  puts "STARTING NEW GAME"
  game = Game.new


  loop do
    game.play
    puts "CURRENT SCORE: #{game.check_game.to_s}"
    puts "CONTINUE?"

    answer = gets.chomp

    if answer == "no"
      abort
    end

    if game.check_game <= -2
      puts "YOU LOOSE LOL"
      abort
    end
  end
end



# byebug
# puts "end"


