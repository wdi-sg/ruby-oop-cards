class Cards
  def initialize
    @cards = *(1..52)
  end

  def draw
    @cards.sample
  end
end
