class Cards

  def initialize
    @cards = []
    53.times do |number|
      (@cards << number).delete(0)
  end
end

  def show_card
    @cards.shuffle.first
  end

  # def get_card
  #   @cards.shuffle.pop
  # end

end