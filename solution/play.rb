require './game'
require './cards'
require './player'

playing = true

game = Game.new


puts "Enter Player's Name : "
player = Player.new(gets.chomp)
puts "\033[1;33m\Welcome, #{player.name} to General Assembly SG RUBY Casino!"
puts
puts "\033[0;31m\Press Any Key to Begin"
gets.chomp



while playing

    puts "\033[0m\Hello #{player.name}, your current score is: #{game.check_game.to_s}"

    puts "Do you want to play this hand? ('y' to play, 'n' to fold & 'q' to quit)"

    answer = gets.chomp

    if answer == 'y'
        game.play
    elsif answer == "n"
        puts "player opts to fold...."
        next
    elsif answer == "q"
        begin
            playing = false
            exit
        rescue SystemExit
            puts "Hello #{player.name}, your final score is: #{game.check_game.to_s}"
            puts "Hope to See U Again!"
            puts "\033[4;31m\GAME SUMMARY\033[0m\  "
            game.report_summary
        end
    end



    if game.check_game < -2
        playing = false
        puts "You have lost! Casino kicks you out! \n\n"
        puts "\033[4;31m\GAME SUMMARY\033[0m\  "
        game.report_summary
    end
end
