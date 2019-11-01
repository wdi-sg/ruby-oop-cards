class Cards
 def initialize
   @cards = (1..52).to_a
 end
end



class Game
  def initialize
     @deck = Cards.new
     @score = 0
     @hands = []
  end

  def play
    player = @cards.shuffle.first
    dealer = @cards.shuffle.first

    @hands << [player, dealer]

    if player > dealer
      @score += 1
    elsif player < dealer
      @score -= 1
    end
  end

  def win_check
    @score
  end

end