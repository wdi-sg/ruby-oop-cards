class Game
  attr_reader :deck
  def initialize
    @deck = Cards.new
    @score = 0
    @user_hand = []
    @house_hand = []
  end

  def lose
    puts "You lost!"
    exit
  end

  def win
    puts "You won!"
    exit
  end

  def draw_cards
    @user_hand = @deck.show_card
    @house_hand = @deck.show_card
  end

  def play_hand
    if @user_hand > @house_hand
      puts "Your hand: #{check_hand.to_s}"
      puts "Ai's hand: #{check_ai.to_s}"
      puts "You win!"
      @score += 1
    else
      puts "Your hand: #{check_hand.to_s}"
      puts "Ai's hand: #{check_ai.to_s}"
      puts "You lost!"
      @score -= 1
    end
  end

  def fold
    puts "Your hand: #{check_hand.to_s}"
    puts "Ai's hand: #{check_ai.to_s}"
    @score -= 0.5
  end

  def check_game
    @score
  end

  def check_hand
    @user_hand
  end

  def check_ai
    @house_hand
  end

end
