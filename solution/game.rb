class Game
  def initialize
    @deck = Cards.new
    @score = 100
    @hands = []
  end

  def play
    user_hand = @deck.show_card
    puts "Your hand is #{user_hand}"
    house_hand = @deck.show_card
    puts "The house hand is #{house_hand}"

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
