require './cards'

class Game
    def initialize
        @deck = Cards.new
        @score = 0
        @hands = []
    end

    def play
        user_hand = @deck.show_card
        house_hand = @deck.show_card

        @hands << [user_hand, house_hand]

        if user_hand > house_hand
            @score += 1
        else
            @score -= 1
        end
    end

    def check_game
        @score
    end

    def print_hand
        puts @hands
    end
end

# game = Game.new
# game.print_hand


