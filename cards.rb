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
      if @bet_amt != nil
        @score += @bet_amt
      end
    else
      puts 'You lost'
      @score -= 1
      if @bet_amt != nil
        @score -= @bet_amt
      end
    end
  end
  def wager(bet)
    @bet_amt = bet
  end
  def check_game
    @score
  end
end

start = false
name = ''

puts 'Welcome do you want to begin?'
input = gets.chomp
if input == 'y'
  puts 'Enter your name challenger'
  name = gets.chomp
  start = true
else
  puts 'Are you a joke?'
end

game = Game.new

while start == true

  puts "#{name} this is your current score: #{game.check_game.to_s}"

  puts "Do want to wager using your points?"
  bet = gets.chomp
  if bet == 'y'
    puts 'What is the amount?'
    bet_amt = gets.chomp.to_i
    game.wager(bet_amt)
    puts "Do want to draw a card?"
  elsif bet == 'n'
    puts "Do want to draw a card?"
  end

  answer = gets.chomp
  if answer == 'n'
    puts 'Thanks for playing'
    puts "#{name} this is your accumulated score: #{game.check_game.to_s}"
    start = false
  elsif answer == 'y'
    game.play
    puts 'Great lets carry on'
  end

  if game.check_game < -5
    puts "You lost too much score so its the end #{name}"
    start = false
  end
end