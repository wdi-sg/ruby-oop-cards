

class Cards

attr_accessor :cards

  def initialize
    @cards = []
    @cards << (1..52).each{|x| x}
  end

  def shuffle_cards
    @cards.shuffle!
  end

  def get_cards
    @cards.shuffle!.pop(2)
  end

end



class Game

  attr_accessor :deck
  attr_accessor :score

  def initialize
    super
    @deck = Cards.new
    @score = 0
  end

  def play_game

    @user_cards << @deck.get_cards
    puts "You drew #{user_card}."

    @bot_cards << @deck.get_cards
    puts "Bot drew #{bot_card}"

    if @user_cards.max > @bot_cards.max
      @score += 1
    else
      @score -= 1
    end
  end

  def score_check
    @score
  end

end





