class Game
  def initialize
    @deck = Cards.new
    @score = 0

  end

  def play_game
    dealer_hand = @deck.show_card_dealer
    puts "Dealer's hand is: #{dealer_hand}"
    @deck.cards.shift



    player_hand = @deck.show_card_player
    puts "Player's hand is: #{player_hand}"
    @deck.cards.shift

    p @deck.cards

    if player_hand > dealer_hand
      @score += 1
    else
      @score -= 1
    end
  end

  def check_score
    @score
  end

end