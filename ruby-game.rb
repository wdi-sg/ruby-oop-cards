class Cards
  def initialize
    @cards = []
    1.upto(52) {|i| @cards.push(i)}
  end

  def deal_card
    @cards.shuffle.first
  end
end

# check if deck created
# deck = Cards.new
# p deck

class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @round = []
  end

  def play
    player = @deck.deal_card
    puts "you got #{player}"
    computer = @deck.deal_card
    puts "computer got #{computer}"

    @round << [ player, computer ]

    if player > computer
      @score += 1
    else
      @score -= 1
    end
  end

  def check_score
    @score
  end
end

game = Game.new

print "What's your name?"
name = gets.chomp
puts "Hi #{name}, welcome to the game."

playing = true

while playing

  game.play
  puts "Your current score is: #{game.check_score}"

  if game.check_score < -2
    playing = false
    puts "You lost."
  else
    print "#{name}, do you want to play this hand?(y/n)"
    answer = gets.chomp
    if answer == "n"
      puts "folding"
    end
  end
end