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
    @score = 0
    @cardsPlayed = []
  end

  def play
    @deck
    user_hand = @deck.getOneCard
    house_hand = @deck.getOneCard

    @cardsPlayed << [user_hand, house_hand]

    puts "You drew a: #{user_hand}"
    puts "The house drew a: #{house_hand}"

    if user_hand > house_hand
      puts "Your card is higher. You win a point!"
      @score += 1

    else
      puts "Your card is lower. You lose a point!"
      @score -= 1

    end

  end

  def check_game
    @score
  end

end