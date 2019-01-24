class Card
  def initialize
    @card = (1..52).to_a
  end

  def draw
    @card.shuffle.pop
  end
end

class Game
  attr_accessor :score

  def initialize
    @deck = Card.new
    @score = 0
    @hands = []
  end

  def play
    puts "Do you want to wager y/n?"
    wagerdecide = gets.chomp
    if wagerdecide == "n"
      userwager = 1
    end
    if wagerdecide == "y"
      puts "How much would you like to wager?"
      userwager = gets.chomp.to_i
    end

    playerhand = @deck.draw
    opponenthand = @deck.draw
    if playerhand > opponenthand
      @score = @score + userwager
      puts "------------------------------------------------------------------"
      puts "You won the hand!"
    end
    if opponenthand > playerhand
      @score = @score - userwager
      puts "------------------------------------------------------------------"
      puts "You lost the hand!"
    end
    @hands << [playerhand,opponenthand]
  end
end

#play sequence

game = Game.new

puts "What is your name?"
username = gets.chomp

loop do
puts "Hello #{username}! You have #{game.score}"
puts "Do you want to play? y/n"
userdecide = gets.chomp
if userdecide == "n"
  puts "Game Over! Your score is #{game.score}"
  break
end

  game.play

if game.score <= -2
  puts "Game Over! You Lost!"
  break
  end
end