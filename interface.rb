require './card'
require './card_manager'
require './game'
require 'byebug'

playing = true
won = false
game = Game.new

puts "Hello. What is your name?"
name = gets.chomp

while playing
    game.draw
    puts "\n#{name}, your current score is: #{game.player_score}\n\n"
    puts "The computer draws a card..."
    puts "You draw a card... It's a #{game.player_hand.to_s}.\n"
    puts "Do you want to play this hand?"

    answer = gets.chomp
    if answer == "no"
        puts "\nFolding your hand..."
        game.discard
    end

    if answer == "yes"
        puts "\nThe computer had a #{game.com_hand.to_s} !"
        if game.player_won_round 
            puts "You won a round!" 
        else
            puts "You lost a round!"
        end
        game.score
        game.discard
    end

    if answer == "quit"
        playing = false
    end

    if game.player_score < -2
        playing = false
    elsif game.player_score == 3
        playing = false
        won = true
    end

end

if won 
    puts "You finished the game with 3 points!"
else
    puts "You lost the game with #{game.player_score} points :("
end
