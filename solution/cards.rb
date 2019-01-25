class Cards
  def initialize
    @cards = (1..52).to_a
  end

  def show_card
    @cards.shuffle.first
  end

  def get_card
    @cards.shuffle.pop
  end
end
