require 'byebug'

class Card

    attr_accessor :value, :suit

    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def to_s
        "#{value} of #{suit}"
    end

end