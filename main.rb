class Card
    def initialize value
        @value = value
    end

    def value
        @value
    end
end

class Deck
    def initialize
        count = 0
        cards = []
        52.times do
            count+=1
            card = Card.new(count)
            cards<<card
        end
        @cards = cards
    end
    def cards
        @cards
    end
end

class Game
    def initialize 
        deck = Deck.new
        deck.cards.shuffle!
        @deck = deck
        @player_1_hand = []
        @player_2_hand = []
        @player_1_points = 0
        @player_2_points = 0
        @turn = 0
    end

    def drawCards
        @player_1_hand << @deck.cards.slice!(0)
        p @player_1_hand
        @player_2_hand << @deck.cards.slice!(0)
        p @player_2_hand
        if @player_1_hand[@turn].value > @player_2_hand[@turn].value
            @player_1_points+=1
            @player_2_points-=1
        else
            @player_2_points+=1
            @player_1_points-=1
        end
        puts "player 1 points is: " + @player_1_points.to_s
        puts "player 2 points is: " + @player_2_points.to_s
        @turn+=1
    end

end

game = Game.new
gets.chomp