class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []
  end

  #game begins Card.new new set of cards inserted

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card
    #shows a card to both the user and the house
    @hands << [user_hand, house_hand]
    #inserts their cards into the array of hands
    if user_hand > house_hand
      @score += 1
    else
      @score -= 1
    end
    if user_hand = house_hand
      @hands << [user_hand, house_hand] 
      @score += 1 || @score -=2
  end

  #checks and compares score and will distribute accordingly
  #
  def check_game
    @score
  end
end

#gives score at end of game via score tracker
