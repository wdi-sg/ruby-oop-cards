puts "Hello player. What is your name?"
name = gets.chomp
puts "Hello #{name}. Let's play this game. Creating cards now..."

class Card 
#need to initialize this 
    def initialize
        @elements = []
        (1..52).each do |i|
        # puts "adding card with value #{i} to the deck"
        elements.push(i)
        end
        elements.shuffle!
        # elements.each {|i| puts "Card was #{i}"}
        
    end
    def elements
        @elements
    end
end 

cards = Card.new
p cards.elements

class Game 
        

end
# puts "helloe world #{ARGV[0]}"