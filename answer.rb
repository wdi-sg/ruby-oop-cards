class Cards
  attr_accessor :deck

  def initialize
    @deck = []

    (1...53).each do |i|
      @deck << i
    end
  end

  def shuffle
    @deck.shuffle
  end
end

class Game
  attr_reader :score
  attr_reader :hands

  def initialize
    @score = 0
    @hands = [] # index 0 is player hand, index 1 is dealer hand
  end

  def play
    deck = Cards.new.shuffle
    @hands = [deck.shift, deck.shift]
    puts "Your Hand: #{@hands[0]}"
    puts "Dealer's Hand: #{@hands[1]}"
    if @hands[0] > @hands[1]
      @score += 1
      puts 'You won'
    else
      @score -= 1
      puts 'You lost'
    end
  end

end

playing = true
new_game = Game.new
turn = 0
puts 'What is your name?'
name = gets.chomp

while playing
  turn += 1
  puts "Hello #{name}, your score: #{new_game.score}"
  new_game.play
  puts "Your score: #{new_game.score} \nDo you want to continue playing? (y/n)"
  reply = gets.chomp
  if new_game.score == -2
    puts "Game Over! \nNo. of turns: #{turn}"
    playing = false
  end
  if reply == 'n'
    playing = false
    puts "Your final score: #{new_game.score} \nNo. of turns: #{turn}"
  end
end




