class Cards
  def initialize
    @cards = (1..52).to_a.shuffle
  end

  def get_card
    # shuffle and get the first number
    @cards.first
  end

  def delete_card
    # delete the number from the deck so cannot use anymore
    @cards.shift
  end

end

# deck = Cards.new
# puts "befoooorrreee  "
# p deck

# deck.get_card
# deck.delete_card

# puts "afterrr "
# p deck

# deck.delete_card
# p deck

class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hand_array = []
  end

  def play
    p @deck
    @player_card = @deck.get_card
    @hand_array << @player_card
    @deck.delete_card

    @comp_card = @deck.get_card
    @hand_array << @comp_card
    @deck.delete_card

    p @hand_array

    if @player_card > @comp_card
      @score += 1
    else
      @score -= 1
    end
  end

  def total_score
   p @score
  end
end

game = Game.new
game.play
game.total_score