
class Game

  def initialize()
    @deck = Cards.new
    @player_score = 0
    @player_hand
    @house_hand
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

  def check_deck_size
    @deck.check_num_of_cards
  end

  def check_remaining_card
    @deck.check_num_of_cards
  end

  def play
    @player_hand = @deck.get_card
    @house_hand = @deck.get_card

    # if @player_hand > @house_hand
    #   @player_score += 1
    # else
    #   @player_score -= 1
    # end
  end

  def compare_cards
    if @player_hand > @house_hand
      @player_score += 1
    else
      @player_score -= 1
    end
  end

end
