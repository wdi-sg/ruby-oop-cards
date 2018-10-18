#Deck class
class Mydeck
    attr_accessor :cards

    def initialize
        @cards = (1..52).to_a
    end
end

#Start Game class
class Game 
    attr_accessor :deck,:hand,:score,:name

    def initialize
        @deck = Mydeck.new.cards.shuffle
        @hand = []
        @score = 0
        @name = gets.chomp
    end
    
    def turn
        @myCard = @deck[0]
        @botCard =@deck[1]
        @hand += [@deck[0,2]]#WHY
        @deck -= @deck[0,2]#WHY

        puts "You: #{@myCard} / bot #{@botCard}"

        if @myCard > @botCard
        @score += 1
        puts "+1 to score"

        else
        @score -= 1
        puts "-1 to score"
        end
    end
end

#GAMEPLAY

loop do
    puts "Please enter your name"
    gameplay = Game.new
    puts "Welcome #{gameplay.name}.\n"


    loop do

        gameplay.turn

        puts "Your score is #{gameplay.score}.\n "

        if gameplay.score < -2
            puts "Game over\n"
            break
        elsif gameplay.deck.size == 0
            puts "No more cards\n"
            break
        end
    end

    puts "===============================\n"
    puts "Final score is #{gameplay.score}"
    puts "Hand history #{gameplay.hand}\n"
    puts "================================\n"
    puts "type y to play again, other character to quit"

    reply = gets.chomp.downcase

    if reply != 'y'
        return

    end
end






