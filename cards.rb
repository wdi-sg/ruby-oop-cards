class Cards
  def initialize
    @cards = []
    52.times do |num|
      @cards.push(num)
    end
  end

  attr_accessor :cards


  def show_card_dealer
    @cards.shuffle.first
  end

  def show_card_player
    @cards.shuffle.first
  end

  def get_card_player
    @cards.shuffle.first
  end
end