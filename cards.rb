class Cards
  # fill in this class body
  def initialize()
    @cards = (1...52).to_a.shuffle!
  end

  def cards
    @cards
  end

  def draw
    @cards.sample(2)
  end

end