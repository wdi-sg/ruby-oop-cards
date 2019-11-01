class Game

def initialize
  @top_card = -1
  @deck = []
  52.times do |card|
    @deck << card
end

def draw
  @top_card = @top_card + 2
  if @top_card < 52
    @deck[@top_card]
  else
    raise 'Only 52 cards in a deck'
  end

end

end