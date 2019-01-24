class Cards
  def initialize
    @ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    # @cards = []
    # @ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13']
    # @suits = ['clubs', 'diamonds', 'hearts', 'spades']
    # suits.each do |suit|
    #   ranks.size.times do |rank|
    #     @cards << "#{ranks[rank]}, #{suit}, #{rank + 1}"
    #   end
    # end
  end
  def draw_player
    @ranks.shuffle.sample
  end
  def draw_com
    @ranks.shuffle.sample
  end
end

class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []
  end
  def play
    player_card = @deck.draw_player
    computer_card = @deck.draw_com
    @hands << [player_card, computer_card]
    if player_card == computer_card
      puts 'Draw'
    elsif player_card > computer_card
      puts 'You won'
      @score += 1
    else
      puts 'You lost'
      @score -= 1
    end
  end
  def check_game
    @score
  end
end

start = false

puts 'Welcome do you want to begin?'
input = gets.chomp
if input == 'y'
  start = true
else
  puts 'Are you a joke?'
end

game = Game.new

while start == true

  puts "Your current score is: #{game.check_game.to_s}"

  puts "Do want to draw a card?"

  answer = gets.chomp
  if answer == 'n'
    puts 'Thanks for playing'
    puts "Your accumulated score is: #{game.check_game.to_s}"
    start = false
  elsif answer == 'y'
    game.play
    puts 'Great lets carry on'
  end

  if game.check_game < -5
    puts 'You lost too much games so its the end'
    start = false
  end
end