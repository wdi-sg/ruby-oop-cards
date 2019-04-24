class Game

  ###############
  # constructor
  ###############
  def initialize(deck, player, dealer)
    @deck = deck
    @player = player
    @dealer = dealer
  end

  ###############
  # methods
  ###############
  def draw_card ()
    card = @deck.cards.sample
    @deck.cards.delete(card)
  end

  def game_score ()
    puts "Player Score: #{ @player.score }"
  end

  def play_game ()
      # player and dealer each draw a card
      player_card = draw_card()
      dealer_card = draw_card()

      if player_card > dealer_card
        @player.add_score()
      else
        @player.deduct_score()
      end

      puts "Player Card: #{ player_card } vs Dealer Card: #{ dealer_card }"
  end

  def game_end? ()
    if @deck.cards.length == 0 || @player.score < -2
      return true
    end

    false
  end

end