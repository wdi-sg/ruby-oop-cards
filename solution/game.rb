class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []
  end

  def play
    @user_hand = @deck.show_card
    puts "user's hand is #{@user_hand}"
  end

  def show

    puts "How much do you want to wager?"
    wager = gets.to_i

    house_hand = @deck.show_card
    puts "house's hand is #{house_hand}"

    @hands << [@user_hand, house_hand]

    if @user_hand > house_hand
      @score += 1
      puts "You won"
      @score += wager
    else
      @score -= 1
      puts "The house won."
      @score -= wager
    end
  end

  def check_game
    @score
  end

end
