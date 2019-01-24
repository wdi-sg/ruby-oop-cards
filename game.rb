require ('byebug')

class Card
        attr_accessor :cards

        def initialize
            @deck =[]
            (1..52).each do |card|
                @deck.push(card)
            end
            @deck.shuffle!
        end

        def deck
            @deck
        end

end


class Game
        attr_accessor :player_name, :score, :player_hand, :banker_hand

        def initialize(player_name)
        @name = player_name
        @score = 0
        @player_hand = 0
        @banker_hand = 0
        end


        def play(card)
            @player_hand = card.deck.shift
            puts "#{@name} has drawn #{@player_hand}"
            @banker_hand = card.deck.shift
            puts "banker has drawn #{@banker_hand}"
            if @player_hand > @banker_hand
                @score +=1
                puts "#{@name} adds 1 point. Current score is #{@score}"
            elsif @player_hand == @banker_hand
                puts "it's a draw."
            else
                @score -=1
                puts "#{@name} subtracts 1 point. Current score is #{@score}"
            end
        end

end

card = Card.new
puts "Enter your name"
player_name = gets.chomp
game = Game.new(player_name)
loop do
    game.play(card)
    if game.score==-2
        puts "#{player_name} lose. game over."
        break
    elsif card.deck.length==0
        puts "No more cards. #{player_name} won. game over."
        break
    end
end
