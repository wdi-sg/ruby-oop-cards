class Cards
  def initialize
    @cards = []
    52.times do |number|
      @cards << number
    end
  end

  def show_card
    @cards.shuffle.first
  end

  def get_card
    @cards.shuffle.pop
  end
end

class Game
  def initialize
    @deck = Cards.new
    @score = 3
    @hands = []
    @bets = 1
  end

  attr_accessor :bets

  def play
    user_hand = @deck.show_card
    puts "You got #{user_hand}"
    sleep( 0.3 )
    house_hand = @deck.show_card
    puts  "House got #{house_hand}"
    sleep( 0.3 )
    @hands << [user_hand, house_hand]

    if user_hand > house_hand
      puts "You win!"
      sleep( 0.3 )
      @score += @bets
    else
      puts "House win!"
      sleep( 0.3 )
      @score -= @bets
    end
  end

  def check_game
    @score
  end

end

playing = true

game = Game.new

puts "Welcome to card game, what's your name?"
username = gets.chomp


while playing

  if game.check_game <= 0
    puts "You lose!"
    playing = false
    next
  end

  puts "do you want to play?"

  answer = gets.chomp
  if answer == "no"
    sleep( 0.3 )
    puts "folding"
    sleep( 0.3 )
    playing = false
    puts "#{username}'s final score is #{game.check_game.to_s}"
  end

  puts "You have #{game.check_game} points. How much would you like to wager?"
  game.bets = gets.chomp.to_i
  if game.bets > game.check_game
    puts "You cannot bet more than what you have..."
    sleep( 0.3 )
    puts "Defaulted to wagering 1"
    game.bets = 1
  elsif game.bets < -2
    puts "You cannot bet more than what you have..."
    sleep( 0.3 )
    puts "Defaulted to wagering 1"
    game.bets = 1
  else
    puts "Betting #{game.bets}"
    sleep( 0.3 )
  end

  game.play
  puts "Hello #{username}, your current score is: #{game.check_game.to_s}"
  sleep( 0.3 )

end