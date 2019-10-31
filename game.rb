class Game
    def initialize
        #calling the Cards class
        @deck = Cards.new
        #score starts at 0
        @score = 0
        #keep track of each hand played
        @hands = []
    end

    def play
        #both players show their hand
        user_hand = @deck.show_card
        computer_hand = @deck.show_card
    
        # need to keep track of hands, so push each hand into the array using '<<'
        @hands = [user_hand, computer_hand]

        # calculate score
        if user_hand > computer_hand
            #user's score increment's by 1
            @score += 1
        else 
            #user's score decreased by 1
            @score -= 1
    end

    def game_results
        # to see the game's score
        @score
    end

end