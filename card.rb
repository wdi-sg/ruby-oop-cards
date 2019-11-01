class Deck

  attr_accessor :cards

  def initialize
    @cards = [];
    52.times do |number|
      @cards.push(number+1)
    end
  end

  def shuffle
    @cards.shuffle[0]
  end

  def getCard
    @cards.shuffle.pop
  end
end