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

class Player

    def initialize name
        @hand = []
        @points = 0.to_i
        @name = name
    end

    def hand
        @hand
    end


    def points
        @points
    end

    def set_points x
        @points = @points + x
    end

    def name
        @name
    end

end

class Game

    def initialize 
        deck = Deck.new
        deck.cards.shuffle!
        @deck = deck
        puts "Player 1, what is your name?"
        @player_1 = Player.new(gets.chomp)
        puts "Player 2, what is your name?"
        @player_2 = Player.new(gets.chomp)
        @turn = 0
    end
    
    def drawCards
        @player_1.hand << @deck.cards.slice!(0)
        puts @player_1.name + " drew: " + @player_1.hand[@turn].value.to_s
        @player_2.hand << @deck.cards.slice!(0)
        puts @player_2.name + " drew: " + @player_2.hand[@turn].value.to_s
        if @player_1.hand[@turn].value > @player_2.hand[@turn].value
            @player_1.set_points(1)
            @player_2.set_points(-1)
        else
            @player_2.set_points(1)
            @player_1.set_points(-1)
        end
        puts @player_1.name + "\'s point total is: " + @player_1.points.to_s
        puts @player_2.name + "\'s point total is: " + @player_2.points.to_s
        @turn+=1
    end

    def player_1
        @player_1
    end

    def player_2
        @player_2
    end


end

game = Game.new
puts "Game Start, press Enter to draw cards:"
while game.player_1.points > -2 && game.player_2.points > -2 do
    gets.chomp
    game.drawCards
    if game.player_1.points < -1
        puts game.player_2.name + " won!"
    elsif game.player_2.points < -1
        puts game.player_1.name + " won!"
    end
end