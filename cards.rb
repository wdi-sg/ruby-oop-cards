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

print 'Enter your name: '
name = gets.chomp
playing = true
while playing
  game.play
  puts name + ' you have points: ' + game.points.to_s
  if game.points < -2
    playing = false
  end
  option = ''
  while option != 'y' && option != 'n'    
    print 'Do you want to end the game? (y/n)'
    option = gets.chomp
  end

  if option == 'y'
    break
  end
end
print game.hands
puts ''
