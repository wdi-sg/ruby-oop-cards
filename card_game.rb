# ===============================================================
#                         Setting up
# ===============================================================

puts "======================================================================"
puts "\nWelcome to High-Card, a simple game of luck, or is it skill?"
puts "                      Let's find out.\n\n"
puts "   Simply draw a card that is higher than the banker to win"
puts "        Each win against the banker gains you 1 point "
puts " Score 2 points to win, and a score of -2 will end the game"
puts "  Well then let's get to it .... uhhh what's your name again?\n\n"
puts "======================================================================\n\n"

username = gets.chomp
puts "======================================================================"
puts "\n\n"
puts "       Good luck #{username}, may the fortunes be with you!"


# ===============================================================
#                      Building the deck
# ===============================================================

value = []

i = 1

while (i < 53) do

  value.push(i)

  i +=1

end

class Card

  attr_accessor :value

  def initialize (value)
    @value = value
  end


end


deck = value.flat_map{|x| Card.new(x)}


# ===============================================================
#                    Starting the game
# ===============================================================

ask_player = "Please type 'play' to continue, or type anything else to end the game \n\n"

puts ask_player
puts "======================================================================\n\n"


score = 0

while (score <3 and score >-3) do


  answer = gets.chomp

  if (answer == "play")


    first_hand =  deck.shuffle.first
    second_hand =  deck.shuffle.first

    puts "======================================================================"
    puts "\n\n"
    puts "              #{username} has drawn #{first_hand.value}"
    puts "              Banker has drawn #{second_hand.value}\n\n"


    # ===============================================================
    #                      Checking who wins
    # ===============================================================
    if (first_hand.value > second_hand.value)
      score = score + 1
      puts "Nice pick #{username}! You won against the banker in this round and your total points are now #{score}!"

    else
      score = score - 1
      puts "Oh no looks like #{username} has lost against the banker in this round, your total points are now #{score}!"

    end



    if (score == 2)

      puts "\n\nCongratulations #{username}! You have won the game. Will you win again next time?\n\n"
      puts "               Let's find out in the next game!"

      return

    elsif (score == -2)

      puts "\n\nOof! It seems that our player #{username} has lost this time. Will you win the next time?\n\n"
      puts "               Let's find out in the next game!"

      return

    end




    puts ask_player
    puts "======================================================================\n\n"

    # ===============================================================
    # ===============================================================





  else

    puts "\n\n"
    puts "       Bye #{username}! See you next time!\n\n"
    return

  end


end