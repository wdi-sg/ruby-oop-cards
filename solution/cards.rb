class Cards
  def initialize
    @cards = []
    52.times do |number|
      @cards << number
    end
  end

  def show_card
    @cards.shuffle.first
  end

  def get_card
    @cards.shuffle.pop
  end
end
# card = Cards.new
# puts card.show_card
# puts card.get_card