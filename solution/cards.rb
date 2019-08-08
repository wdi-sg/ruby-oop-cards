class Cards
  def initialize

    @cards = []
    13.times do |number|
        @cards << [number+1, 'Spades']
        @cards << [number+1, 'Hearts']
        @cards << [number+1, 'Diamonds']
        @cards << [number+1, 'Clubs']
    end

    @suits = {
        'Spades' => 4,
        'Hearts' => 3,
        'Diamonds' => 2,
        'Clubs' => 1
    }

    shuffle_card
  end

  def respawn_cards
      @cards = []
      13.times do |number|
          @cards << [number, 'Spades']
          @cards << [number, 'Hearts']
          @cards << [number, 'Diamonds']
          @cards << [number, 'Clubs']
      end

      shuffle_card
  end

  def shuffle_card
      @cards = @cards.shuffle
  end

  def show_card
      showcard = @cards.last
      @cards.pop
      showcard = "#{name_cards(showcard[0])}, #{showcard[1]}"
      return showcard
  end

  def suits
      @suits
  end

  def name_cards(param)
      case param
      when 1
          "Ace"
      when 11
          "Jack"
      when 12
          "Queen"
      when 13
          "King"
      else
          param
      end
  end

  def cards_left
      @cards.length
  end

end


# @cards << [number, 'Spades']
# @cards << [number, 'Hearts']
# @cards << [number, 'Diamonds']
# @cards << [number, 'Clubs']
