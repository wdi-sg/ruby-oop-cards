class Cards
  #this is an entire array
  def initialize
    @cards = []
    52.times do |number|
      @cards << number
    end
  end

  #takes the array which is cards give number a value of 1-52 << inserts the values into the array

  def show_card
    @cards.shuffle.first
  end

  #display first card of deck
  def get_card
    @cards.shuffle.pop
  end

  #takes the last card of the array (.shift takes first)
end
