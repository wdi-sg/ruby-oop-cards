class Card

  attr_accessor :cards

  def initialize
    @cards = []
    52.times do |num|
      @cards << num
    end
  end

  def draw_card
    @cards.shuffle.pop
    # when drawing cards, the deck's length minus 1
  end

end