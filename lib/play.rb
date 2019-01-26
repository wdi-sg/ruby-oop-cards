# require 'byebug'

class Cards
  def initialize (suit, value)
    @suit = suit
    @value = value
  end

  def suit
    @suit
  end

  def value
    @value
  end
end


class Game
  def initialize
    @suits = ['♠', '♥', '♣', '♦']
    @value = [*(2..10), "J", "Q", "K", "A"]
    @cards = []
    @value.each { |value| @suits.each { |suit| @cards << Cards.new(value,suit) } }
    # byebug
  end

  def player
    @player = @cards.shuffle.first
  end

  def com
    @com = @cards.shuffle.first
  end

end


game = Game.new


class Play
    @score = 0
    @cont = "y"

  def compare
    if @values.index(@game.player) > @values.index(@game.com)
        @score += 1
        puts "You win!, do you want to continue? (y/n)"
        @ans = gets.chomp
            if @cont == "y"
                loop do
                    @game.player
                    @game.com
                end
            elsif @cont == "n"
                puts "Game ended"
            else
                puts "Error"
            end
    else
        score -= 1
        puts "You lose!, do you want to continue? (y/n)"
    end
  end

end

play = Play.new

p play.compare