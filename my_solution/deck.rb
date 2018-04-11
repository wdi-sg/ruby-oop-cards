class Deck
  attr_reader :cards, :draw_card, :check_hand

  def initialize
    # @cards = [*1..52]
  end

  def draw_card(player)
    player[:hand] = @cards.shift
    print "#{player[:name]} drew #{player[:hand]}.\n"
  end

  def check_hand(player1, player2)
    if player1[:hand] > player2[:hand]
      player1[:score] += 1
    else
      player2[:score] += 1
    end
  end

end