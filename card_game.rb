class Cards

    attr_accessor :cards

    # Create an array of cards with values 1 - 52 using Code Blocks
    cards = []
    cardNum = 1

    until cardNum > 52 do
        cards.push(cardNum)
        cardNum += 1
    end

    def initialize (cards)
        @cards = cards
    end

end


# Create Game class
class Game

    def initialize (cards_for_play)
        # Start a game with cards
        # @cards_for_play = Cards.new

    end


end

=begin
    # Why cannot read the card length ...
    select_card_1 = Cards.new("card1")
    card1 = rand(cards.length)
    p card1
=end
