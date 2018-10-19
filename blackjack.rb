require "byebug"

$SUITS = ['C', 'S', 'H', 'D']
$RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K' ]
$VALUE = {"A"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "10"=>10, "J"=>10, "Q"=>10, "K"=>10}
$IN_PLAY = true

class Card 
    attr_accessor :suit, :rank

    def initialize (suit, rank)
        if $SUITS.include?(suit) && $RANKS.include?(rank)
            @suit = suit
            @rank = rank
        else 
            @suit = nil
            @rank = nil
            puts "invalid card"
        end
    end
end

class Deck
    def initialize
        @deck = []
        for suit in $SUITS 
            for rank in $RANKS
                @deck << Card.new(suit, rank)
            end
        end
    end

    def shuffle 
        @deck.shuffle!
    end

    def deal
        card = @deck.pop
    end
end

class Hand
    def initialize
        @hand = []
    end

    def draw (card)
        @hand << card
    end

    def get_value
        @hand_ranks = []
        @hand_values = []
        for card in @hand
            @hand_ranks << card.rank
        end
        for i in @hand_ranks
            @hand_values << $VALUE[i]
        end
        if !@hand_ranks.include?("A")
             total = @hand_values.inject(0){|sum, x| sum + x}
        else 
            total = @hand_values.inject(0){|sum, x| sum + x}
            
            if total + 10 <= 21
                total += 10
            else 
                return total
            end
        end

    end

end

puts "Are you ready?"

response = gets.chomp # game start regardless

if response == "yes"
    $IN_PLAY = true
end

newDeck = Deck.new
newDeck.shuffle

playerHand = Hand.new
dealerHand = Hand.new

#alternate
playerHand.draw(newDeck.deal)
dealerHand.draw(newDeck.deal)
playerHand.draw(newDeck.deal)
dealerHand.draw(newDeck.deal)

player_value = playerHand.get_value
puts "You have #{player_value} points, hit or stand?"
output = gets.chomp

while output != "stand" do
    playerHand.draw(newDeck.deal)
    player_value = playerHand.get_value
    if player_value > 21
        puts "You are busted!"
        break
    else 
        puts "You have #{player_value} points, hit or stand?"
        output = gets.chomp
    end
end

if output == "stand"

    player_value = playerHand.get_value
    dealer_value = dealerHand.get_value

    if $IN_PLAY == true
        while dealer_value <= 17
            dealerHand.draw(newDeck.deal)
            dealer_value = dealerHand.get_value
            if dealer_value <= 21 && dealer_value >= player_value
                puts "You lose, the dealer has #{dealer_value} points" 
                $IN_PLAY = false
            else 
                while dealer_value <= player_value 
                    dealerHand.draw(newDeck.deal)
                    dealer_value = dealerHand.get_value
                    if dealer_value <= 21 && dealer_value >= player_value
                        puts "You lose, the dealer has #{dealer_value} points" 
                        $IN_PLAY = false
                    else
                        puts "You win, the dealer has #{dealer_value} points"
                        $IN_PLAY = false
                    end
                end
            end
        end
    end

end

