class Cards
  def initialize
    @cards = []
    52.times do |number|
      @cards << number
    end
  end

  def show_card
    @cards.shuffle.first
    @cards.shuffle.next
  end

  def get_card
    @cards.shuffle.pop
  end
end