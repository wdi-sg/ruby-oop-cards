
class Cards
    attr_accessor :cards
    def initialize
        @cards = []
        52.times do |i|
            @cards << i
        end
    end
    
    def draw_card
        @cards.shuffle.pop
    end
end

class Game
    attr_accessor :score, :deck
    def initialize
        # Get new cards
        @deck = Cards.new
        @score = 0
        @hands = []
    end

    def play
        player_hand = @deck.draw_card
        puts player_hand
        opponent_hand = @deck.draw_card
        puts opponent_hand

        @hands << [player_hand, opponent_hand]

        if player_hand > opponent_hand
            @score += 1
        else
            @score -= 1
        end
    end

    def check_game
        @score
    end
end


# Start game
game = Game.new

while game.score > -2

    game.play
        puts "Current score is #{game.check_game.to_s}"
        
        puts "do you want to continue?"

    answer = gets.chomp
    
    if answer == "no"
        puts "not playing"
        next
    end

end