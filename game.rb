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
  def player ()
    @player
  end

  def dealer ()
    @dealer
  end

  def deck ()
    @deck
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

  def game_end? ()
    if @deck.cards.length == 0 || @player.score < -2
      return true
    end

    false
  end

end