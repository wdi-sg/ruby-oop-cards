require 'byebug'

class Card

    attr_accessor :card, :deck
    
    def initialize
        # puts "create new deck"
        @deck = []
        for i in 1..52
            @deck << i 
        end
        @card = nil
    end

    def draw 
        index = rand(@deck.size+1)
        @card = @deck[index]
        @deck.slice!(index)
    end


end


class Game 

    attr_accessor :score, :deck
    attr_reader :playerOne, :playerTwo
    
    def initialize 
        @score = 0
        @playerOne = 0
        @dealer = 0
        @deck = Card.new
        #should initialize the deck
    end

    def playerDraw
        @playerOne = @deck.draw
    end

    def dealerDraw
        @dealer = @deck.draw
    end

    def compare
        if @playerOne > @dealer
            @score += 1
        elsif @dealer > @playerOne
            @score -= 1
        end
    end

    def wager(points)
        # bet the number of pts he have for similar pts
    end

end

puts "Hey mate, what is your name"

name = gets.chomp 

newGame = Game.new
newGame.playerDraw
newGame.dealerDraw
newGame.compare

while newGame.score > -3 do
    puts "Hello #{name}, you have #{newGame.score} points. Do you want to continue?"
    conditional = gets.chomp
    if conditional == "no"
        break
    end
    newGame.playerDraw
    newGame.dealerDraw
    newGame.compare
end

puts "Game over"
