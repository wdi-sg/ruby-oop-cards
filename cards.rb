class Card

  def initialize

    @cards= (1..52).to_a

end

  def show_card
    @cards.shuffle.first
  end

    def get_card
    @cards.shuffle.pop
  end
end

p "#{Card}"
card1= Card.new
puts card1.show_card