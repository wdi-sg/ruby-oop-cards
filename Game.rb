class Game
  def initialize(name)
    @name = name
    @deck = Cards.new
    @score = 0
    @hands = []
  end

  def play()
    player_hand = @deck.show_card
    house_hand = @deck.show_card
    @hands << [player_hand, house_hand]
    if player_hand > house_hand
      p "#{@name} hand: #{player_hand}, House hand: #{house_hand}"
      @score += 1
    else
      p "#{@name} hand: #{player_hand}, House hand: #{house_hand}"
      @score -= 1
    end
  end

  def check_game
    @score
  end
end
