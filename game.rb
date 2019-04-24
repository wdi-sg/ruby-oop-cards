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
      puts "#{ @player.name }, you have #{ @player.score } points available for betting. Please place your bet!"
      bet = gets.chomp.to_i
  end

  def play_game (bet)
      # player and dealer each draw a card
      player_card = draw_card()
      dealer_card = draw_card()

      puts "Player Drawn Card: #{ player_card.name.capitalize } of #{ player_card.suite.capitalize } vs Dealer Drawn Card: #{ dealer_card.name.capitalize } of #{ dealer_card.suite.capitalize } "

      if player_card.number > dealer_card.number
        puts "#{ @player.name }, you have won #{ bet } points!"
        @player.add_score(bet)

      elsif player_card.number == dealer_card.number && player_card.suite_weightage > dealer_card.suite_weightage
          puts "#{ @player.name }, you have won #{ bet } points!"
          @player.add_score(bet)

      else
        puts "#{ @player.name }, you have lost #{ bet } points!"
        @player.deduct_score(bet)
      end
  end

  def game_end? ()
    if @deck.cards.length == 0 || @player.score < -2
      return true
    end

    false
  end

end