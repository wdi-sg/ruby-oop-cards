class Card
    def initialize
        @cards = []
        52.times { |num|
            @cards << num
        }
    end
end