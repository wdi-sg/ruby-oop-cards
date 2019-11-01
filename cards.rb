class Cards

def initialize
  @top_card = -1
  @deck = []
  52.times do |card|
    @deck << card

  # @deck = (1 .. 52).to_a
end

def shuffle
  @top_card = -1
  @deck = @deck.sort_by{rand}
end

def showCard
  puts @deck
end



end