class Cards
  def initialize
    @cards = Array (1..52)
  end

  def cards
    @cards.shuffle
  end
end

deck = Cards.new

class Game
  def initialize()
    @deck = Cards.new
    @player_hand = []
    @house_hand = []
    @score = 0
  end

  def deck
    @deck
  end

  def player_hand
    @player_hand << deck.cards[0]
  end

  def house_hand
    @house_hand << deck.cards[1]
  end

  def compare
    @player_hand << deck.cards[0]
      puts "u got #{player_hand[0]}"

    @house_hand << deck.cards[1]
      puts "i got #{house_hand[0]}"

    if house_hand[0] < player_hand[0]
      @score += 1
      puts "u won, ur score is #{@score}"
    else
      @score -= 1
      puts "u lost, ur score is #{@score}"
    end
  end
end


start = Game.new()
puts start.compare

# user_input = gets.chomp