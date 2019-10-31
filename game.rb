class Game
  attr_accessor :name

  def initialize(name)
    @name = name
    @deck = Cards.new
    @score = 0
    @hands = []
  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card
    puts "your hand value: #{user_hand}"
    puts "house hand value: #{house_hand}"

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
