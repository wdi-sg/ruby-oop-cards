require './card'
require 'byebug'

class CardManager

    attr_accessor :values, :suits, :cards, :played_cards

    def initialize
        @values = [*(2 .. 10), 'J', 'Q', 'K', 'A']
        @suits = ['♦', '♣', '♥', '♠']
        @cards = []
        @played_cards = []
        @values.each { |value| @suits.each { |suit| @cards << Card.new(value,suit) } } 
        @cards.shuffle!
    end

    def draw
        @cards.pop
    end

    def discard(cardOne, cardTwo)
        @played_cards.push *[cardOne, cardTwo]
    end

    def compare(cardOne, cardTwo)
        if @values.index(cardOne.value) == @values.index(cardTwo.value)
            if @suits.index(cardOne.value) > @suits.index(cardTwo.value)
                true 
            else 
                false
            end
        elsif values.index(cardOne.value) > values.index(cardTwo.value) 
            true
        elsif values.index(cardOne.value) < values.index(cardTwo.value)
            false
        end
    end

end