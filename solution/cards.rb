class Cards
  attr_reader :cards
  def initialize
    @cards = []
    52.times do |number|
      @cards << number
    end
  end

  def show_card
    @cards.shuffle!.shift
  end

end
