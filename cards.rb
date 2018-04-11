class Card
  attr_reader :cards
  def initialize 
    @cards = Array (1..52)
    @cards.shuffle!
  end
end


class Game
  attr_reader :hands, :points
  def initialize
    @points = 0
    @hands = []
    @deck = Card.new
  end
  def play
    drawn = [@deck.cards.pop, @deck.cards.pop]
    @hands.push(drawn)
    if drawn.find {|card| card == 52}
      @points += 1
    else
      @points -= 1
    end
  end
end

game = Game.new

playing = true
while playing
  game.play
  if game.points < -2
    playing = false
  end
end
puts 'points ' + game.points.to_s
print game.hands
puts ''
