class Cards
    # initialize
    def initialize
        # create empty array
        @cards = []
        # loop ...something 52 times
        52.times { |number|
            @cards << number
        }
    end

    # for house to show hand
    def show_card
        @cards.shuffle.first
    end

    # for player to draw card from bottom?

    def get_card
        @cards.shuffle.pop
    end

end

