class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []
    @user_hand = 0
    @house_hand = 0
  end

  def draw
    @user_hand = @deck.show_card
    @house_hand = @deck.show_card

    @hands << [@user_hand, @house_hand]
  end

    def play
    if @user_hand > @house_hand
      @score += 1
    else
      @score -= 1
    end
  end

  def check_game
    @score
  end

  def showing_user_hand
    @user_hand
  end

    def showing_house_hand
    @house_hand
  end

end
