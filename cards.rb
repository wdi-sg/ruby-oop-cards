class Cards
    def initialize
        @cards = (1..52).to_a.shuffle
    end

    def show_card
         @cards.first
    end

    def get_card
         @cards.pop
    end

    def print_card
        puts @cards
    end
end

cards = Cards.new
cards.print_card
