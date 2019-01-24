require 'byebug'

class Cards
    attr_accessor :suits, :suits
    
    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def value 
        @value
    end

    def suit
        @suit
    end
end

class Game
    attr_accessor :values, :suits, :carddeck, :discarddeck, :drawcardplayer, :drawcardopponent, :points

    def initialize
        @values = (2..10).to_a + ['J', 'Q', 'K', 'A'] 
        @suits = ['♠', '♥', '♣', '♦']
        @discarddeck = []
        @carddeck = []
        $points = 10

        @values.each do |value|
            @suits.each do |suit|
                @carddeck << Cards.new(value, suit)
            end
        end
        # shuffles deck
        @carddeck.shuffle!
    end

    def draw
        # p @carddeck
        # player's card
        @drawcardplayer = @carddeck[0]
        puts "You drew #{@drawcardplayer.value} #{@drawcardplayer.suit}."
        
        # # opponent's card
        @drawcardopponent = @carddeck[-1]
        puts "Opponent drew #{@drawcardopponent.value} #{@drawcardopponent.suit}."

    end
    
    def compare
        if @values.index(@drawcardplayer.value) > @values.index(@drawcardopponent.value)
            puts "Your card is bigger than opponent's!" 
            return true
        elsif @values.index(@drawcardplayer.value) < @values.index(@drawcardopponent.value)
            puts "Opponent's card is bigger than yours, oh no." 
            return false
        elsif @suits.index(@drawcardplayer.suit) < @suits.index(@drawcardopponent.suit)
            puts "Your card is bigger than opponent's!" 
            return true
        else
            puts "Opponent's card is bigger than yours, oh no." 
            return false
        end
    end 
    
    def throwcard(winner)
        # add played cards into discard deck
        @discarddeck = @discarddeck.append(@drawcardopponent,@drawcardplayer)

        # remove played cards from played deck
        @carddeck.select! {|obj| obj != @drawcardopponent && obj != @drawcardplayer}
        @carddeck.shuffle!

        if winner == true
            $points += 1
        else
            $points -= 1
        end

        puts "Your current point is #{$points}."
    end 

    def checklose
        if $points < -2
            return true
        else
            return false
        end
    end

end


class Play 
    def initialize
        # initialize the game
        @game = Game.new
        puts 'What is your name?'
        name = gets.chomp
        @play = 'y'
        puts '----------------------------------------------------'

        while @play.include? 'y' 
            puts "Hello #{name}, you have 10 points."
            @game.draw
            roundwinner = @game.compare
            @game.throwcard(roundwinner)
            
            if @game.checklose === true
                @play = 'n'
            else 
                puts "Do you want to continue with the game, #{name}? (y/n)"
                @play = gets.chomp
            end

            if @play.include? 'y'
                puts 'Folding...'
                puts '----------------------------------------------------'
            else
                puts "Your final score is #{$points}. The game has ended"
            end
        end
    end
end

playgame = Play.new


# byebug
# puts 'end'