class Game

  ###############
  # constructor
  ###############
  def initialize(deck, player, dealer)
    @deck = deck
    @player = player
    @dealer = dealer
  end

  ######################
  # get methods
  ######################
  def player()
    @player
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

  def place_bet ()
      puts "#{ @player.name }, please place your bet! (#{ @player.score } points available for betting)"
      bet = gets.chomp.to_i
  end

  def play_game (bet)
      # player and dealer each draw a card
      player_card = draw_card()
      dealer_card = draw_card()

      if player_card > dealer_card
        @player.add_score(bet)
      else
        @player.deduct_score(bet)
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