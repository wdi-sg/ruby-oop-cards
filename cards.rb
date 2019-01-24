class Cards
  attr_reader :cards

  def initialize
    @cards = []
    52.times do |i|
      @cards.push(i+1)
    end
  end

  def drawTwoCard
    @cards = @cards.shuffle
    [@cards[0], @cards[1]]
  end

end