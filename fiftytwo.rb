# Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.

# Create a game class that uses the card class to play a game.

# when you play the game, draw two cards from the deck.
# if the player has the highest card, give them a point.
# if the player doesn't have the highest card, deduct a point.
# if the player's score is less than -2, end the game.
# Inside the game class, keep a record of each hand played in an instance variable array.

# show the score to the player
require 'byebug'
play = true

class Dards
    attr_accessor :cards
    attr_accessor :suit

    def initialize
        @cards = (1..52).to_a
        # @suit = ["spade", "hearts", "diamonds", "clubs"]
        @cards.shuffle!
    end
end

class Game
    @@deck = Dards.new
    attr_accessor :hands
    attr_accessor :score

    def initialize
        @hands = []
        @score = 0
        puts @hands
    end
    
    def self.deck
        @@deck
    end
    
    def deal
        @hands << @@deck.cards.pop
    end
end

player = Game.new
computer = Game.new

while play == true

    player.deal
    computer.deal

    if player.hands.last > computer.hands.last
        player.score += 1
        computer.score -= 1
    else
        computer.score += 1
        player.score -= 1
    end

    if player.score < -2 || computer.score < -2

        play = false

        puts player.score
        puts computer.score
    end
end
puts player.hands
puts computer.hands

byebug

puts 'WhiteJack'


