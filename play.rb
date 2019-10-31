require './game'
require './cards'

#call game

game = Game.new

# boolean seems to be '=' rather than '=='?
playing = true

while playing 
    #execute play hash
    game.play
    #state current score
    # use double quotations, not single
    puts "player's current score is: #{game.game_results.to_s}"

    user_answer = gets.chomp

    if user_answer == "no"
        puts "user folds"
        # next lets you continue the game if user_answer is not 'no'
        next 
    end

    # losing condition
    if game.game_results < -2
        # stop playing
        playing = false
    end
end