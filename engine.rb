class Game
  # fill in this class body
  def initialize(player_name)
    @deck = Cards.new
    @score = 0
    @name = player_name
    @played = []
  end

  def play_round
    # game draws two cards
    @drawn = @deck.draw
    puts "#{@name} drew #{@drawn[0]} against house's #{@drawn[1]}"
    # check if player scored
    if @drawn[0] > @drawn[1]
      @score += 1
    else
      @score -= 1
    end

    # add drawn cards to pile
    @played << @drawn
    # print @played
  end

  def check_score
    @score
  end

end