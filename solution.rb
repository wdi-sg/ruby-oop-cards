class Card
  attr_accessor :cards
  def initialize
    @cards = (1..52).map { |i| i }
  end
end

class Game
  attr_accessor :player_score, :cards
  def initialize
    @cards = Card.new.cards
    @history = []
    @player_score = 0
  end

  def player_draw
    @player_card = @cards.slice!( (rand(@cards.length - 1)), 1 )
    @history << @player_card
    @player_card[0]
  end

  def computer_draw
    @computer_card = @cards.slice!( (rand(@cards.length - 1)), 1 )
    @history << @computer_card
    @computer_card[0]
  end

  def evaluate_game(player, computer)
    if player > computer
      @player_score += 1
      return true
    else
      @player_score -= 1
      return false
    end
  end
end

game = Game.new
puts "Enter Your Name"
name = gets.chomp

while game.player_score > -2
  player_card = game.player_draw
  puts "#{name} drew: #{player_card}"

  com_card = game.computer_draw
  puts "Computer drew: #{com_card}"

  game.evaluate_game(player_card, com_card) ? (puts "#{name} Win") : (puts "#{name} Lose")
  puts "#{name} Score: #{game.player_score}"

  break if game.player_score <= -2

  if game.cards.length == 0
    puts "DECK IS OUT"
    break
  end

  puts "Continue? Enter N to stop"
  continue = gets.chomp

  break if continue == 'N'
end
