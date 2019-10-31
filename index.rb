puts "Welcome Player, What is your name?"
name = gets.chomp
puts "welcome #{name}, lets Play, type start to start playing"
start_command = gets.chomp
class Cards
    def initialize
        @cards = []
        (1..52).each {|i| @cards.push(i)}     
    end

    def deal_card 
        @cards.shuffle.first
    end
end

class Game 
    def initialize
        @score = 0
        @deck = Cards.new
        @hands = []
    end

    def play_game 
        user_card = @deck.deal_card
        com_card = @deck.deal_card

        @hands.push(user_card, com_card)
        puts "-----------------------------------------------------------------"
       
        if user_card > com_card

            puts "Your card : #{user_card} won against opponents card: #{com_card}"
            puts "Yay You won this round"
            @score += 1
        else 
            puts "Your card : #{user_card} lost against opponents card: #{com_card}"
            puts "Sorry You lost"
            @score -= 1
        
    end

    def check_score 
        @score
    end

end
end    



if start_command == "start"
    play_state = true
    game = Game.new

while play_state

    game.play_game

    puts " \nYour Current Score is #{game.check_score}"
    puts "Do you want to keep playing?"
    puts "-----------------------------------------------------------------"
    response = gets.chomp

    if response == "no"
        play_state = false
        puts"******************************************************************"
        puts"******************************************************************"
        puts"                         Score: #{game.check_score}"
        puts"******************************************************************"
        puts"******************************************************************"
        puts "                     \nCome back soon!"

    end

    if game.check_score <= -2
        play_state = false
        puts "game over :("

        end
    end
end





