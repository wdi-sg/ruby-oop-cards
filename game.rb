
class Game

  def initialize()
    @deck = Cards.new
    @player_score = 0
  end

  def check_player_cards
    @player_hand
  end

  def check_house_cards
    @house_hand
  end

  def check_player_score
    @player_score
  end

  def play
    @player_hand = @deck.get_card
    @house_hand = @deck.get_card

    if @player_hand > @house_hand
      @player_score += 1
    else
      @player_score -= 1
    end
  end

end
