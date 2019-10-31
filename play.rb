require './game'
require './cards'

#call game

game = Game.new
cards = Cards.new

# boolean seems to be '=' rather than '=='?
playing = true

puts "Welcome to this simple card game, type your name and hit enter"
user_name = gets.chomp
puts "Game Started!"

sleep( 2 )
while playing 
    game.play
    #state current score
    # use double quotations, not single
    puts "#{user_name}'s current score is: #{game.game_results.to_s}"
    puts "Do you choose to fold?"

    user_answer = gets.chomp

    if user_answer == "no"
        puts "#{user_name} continues"
        # next lets you continue the game
        next 
    elsif user_answer == 'yes'
        playing = false
        puts "#{user_name} folds and game ends"
        
    end

    # losing condition
    if game.game_results < -2
        # stop playing
        playing = false
        puts 'Game has ended!'
    end
end