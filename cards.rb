class Card 
#need to initialize this 
    def initialize
        @elements = []
        (1..52).each do |i|
        puts "adding card with value #{i} to the deck"
        elements.push(i)
        end
    
        elements.each {|i| puts "Card was #{i}"}
        
    end
    def elements
        @elements
    end
end 
cards = Card.new
p cards.elements 
