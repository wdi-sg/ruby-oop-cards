require './game'
require './cards'

puts "Pls enter your name"

playing = true

game = Game.new
user_name = gets.chomp

puts "\nHello #{user_name}, your starting score is: #{game.check_game.to_s}"
turn = 1;

while playing

  old_score = game.check_game

  #~~~~~~~~~~~~~#
  game.play
  #~~~~~~~~~~~~~#
  new_score = game.check_game


#########
  if turn > 1
    puts "\nDo you want to continue the game? yes/no"
    answer = gets.chomp

    if answer == "no"
      puts "You've ended the game. Your final score is #{new_score.to_s}~~~~~"
      playing = false
      next
    end

    #########
    puts ("CHEATING: Round #{turn-1} score is #{old_score}")
    puts ("CHEATING: Round #{turn} score is going to be #{new_score.to_s}")
    puts "\n\n*** Round #{turn}: Ruby Oop Cards***"
    puts "Do you want to play this hand? yes/no"

    answer = gets.chomp
    if answer == "no"
      puts "Folding"
      puts "#{user_name}'s score is #{old_score.to_s}"
      turn += 1
      next
    end

    turn += 1

    puts "\nDo you want to make a wager using your current points? (ie.Win/lost double of what you bet) yes/no"
    answer = gets.chomp

    if answer == "yes"
      puts ("Enter the amount of points you wanna bet with")
      bet = gets.chomp

        if (new_score > old_score)
          new_score = old_score + (bet.to_i * 2)
          old_score = new_score

        else
          new_score = old_score - (bet.to_i * 2)
          old_score = new_score
        end

      puts "#{user_name}'s score is #{new_score.to_s}"
      next
    end

    puts "#{user_name}'s score is #{new_score.to_s}"

    if new_score < -2
      playing = false
      puts "Sorry you've lost the game."
    end

      next
    end
#########
  puts ("CHEATING: Round #{turn-1} score is #{old_score}")
  puts ("CHEATING: Round #{turn} score is going to be #{new_score}")
  puts "\n\n*** Round #{turn}: Ruby Oop Cards***"
  puts "Do you want to play this hand? yes/no"

  answer = gets.chomp
  if answer == "no"
    puts "Folding"
    puts "#{user_name}'s score is #{old_score.to_s}"
    turn += 1
    next
  end

  turn += 1

  puts "#{user_name}'s score is #{game.check_game.to_s}"

  if game.check_game < -2
    playing = false
    puts "Sorry you've lost the game."
  end

end