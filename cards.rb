class Cards
    # initialize
    def initialize
        # create empty array
        @cards = []
        # loop ...something 52 times
        52.times { |number|
            # '<<' means add to the end of this array
            #in this case, a new number is added to the end of @cards
            @cards << number
        }
    end

    # for house to show hand
    def show_card
        @cards.shuffle.first
    end

    # drawing of card?

    def get_card
        @cards.shuffle.pop
    end

end

