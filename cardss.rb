class Cards

    def initialize(card)
        cards = Array(1..52)
        @cards = cards

    end

    def deal

        @cards.shuffle.first

    end

    def get_card
        @cards.shuffle.pop
    end

end



class Games
    def initialize(players, cards)

    end

end