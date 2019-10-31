class Cards
  attr_accessor :cards, :score
  def initialize
    @cards = Array.new(52){|i| i+1}
    @score = 0
  end
end
# deck = Cards.new
# p deck.cards[3]

class Game < Cards

  def drawcard
    @cards.shuffle.last
  end

  def players
    me = drawcard
    you = drawcard
    if me > you
      @score = @score+1
    else
      @score = @score-1
    end
  end

  def checkscore
    @score
  end
end

game = Game.new
# p game.cards
# p game.score
# p game.players
# p game.checkscore

ingame = true
p "Hello, what is your name?"
name = gets.chomp

while ingame
  game.cards
  game.players
  p "Your score is: #{game.checkscore.to_s}, #{name}!"

  p "Draw another card?"
  answer = gets.chomp

  if answer == "no"
    p "game over! You scored #{game.checkscore.to_s} points."
    ingame = false
  end

  if game.checkscore < -2
    p "You scored #{game.checkscore.to_s} points. You lose!"
    ingame = false
  end
end