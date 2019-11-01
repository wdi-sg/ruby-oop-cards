class Cards
    # initialising the deck of 52 cards
    def initialize 
        @cards =[]
        # loop through 52 times
        52.times do |number|
            # this means to add 'number' to the end of the array 'cards'
            @cards << number
        end 
    end
    # defining a method in the class
    # this shuffles the array and then returns you the first of the array
    def show_card
        @cards.shuffle.first
    end
    # this shuffles then removes the last of the array
    def get_card
        @cards.shuffle.pop
    end
end

class Game
    def initialize
        @deck = Cards.new
        @score = 0
        @hands = []
        # @name = name
    end

    # def get_name
        # puts "Hi, what is your name?"
        # name = gets.chomp
    # end

    def play 
        # using the method in the Cards class to return the first of the shuffled deck
        user_hand = @deck.show_card
        house_hand = @deck.show_card
puts "Your hand is #{user_hand}"
puts "House hand is #{house_hand}"

        # adding the cards gotten into the hands array
        @hands << [user_hand, house_hand]

        if user_hand > house_hand
            @score += 1
        else 
            @score -= 1
        end
    end
    # checking the score
    def check_game
        @score
    end
end

# defining the while loop

playing = true
game = Game.new
while playing
    # unless hands
        # game.get_name
    # end 
    game.play 

    # puts "Hi #{game.name}"
    puts "Your current score is #{game.check_game}"
    puts "Do you want to play this hand?"

    # gets input from the player
    answer = gets.chomp
    if answer == "no"
        puts "folding"
        next
    end
    if game.check_game < -2
        playing = false
    end
end