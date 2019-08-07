
#Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.
# Also, include the function draw the first cards.
# & included the function to draw the last card for the player.

class card

  def initialize
    @card = (1..52).to_a
  end

  def show_card
    @card.shuffle.first

  def draw_cards
    @card.shuffle.pop
  end
end


class game

  def initialize
    @deck = card.new
    @score = 0
    @hands = []
  end

  def play
    user_play = @deck.show_card
    house_play = @deck.show_card

    @hands << [user_play, house_play] #would like to insert the user card and house card to the show card deck

    if user_play > house_play
      @score +=1
    else
      @score -=1
    end
end




  end

end


class play
  def initialize
  end
end



print