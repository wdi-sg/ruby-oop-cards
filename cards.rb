# An array of cards that are of value 1-52.
class Cards
  def initialize
    @cards = []
    52.times { |i| @cards << i + 1 }
  end

  def draw
    @cards.shuffle.pop
  end

  def amount
    @cards.length
  end
end
