require './game'
require './cards'


playing = true

game = Game.new


print "What is your name"
puts
@player_name = gets.chomp


while playing


  print "Wager on it?"
  puts
  @wager = gets.chomp
  if @wager == 'no'
    @wager = 0
  else
    game.wager(@wager)
    puts "Lad placed a bet of #{@wager}"
  end




  game.play
  # puts game.deck
  puts "#{@player_name}, your current score is: #{game.game_status}"

  puts "draw again? \n"


  if game.game_status <= -1
    playing = false
    puts "You loseeeee \n "
    puts "#{game.wager} \n"
  end



  answer = gets.chomp
  if answer == "no"
    puts "Skipped a turn"
    next
  end

  if game.cards_left == 0
    puts "Lucky baster, #{@player_name} Wins!"
  end

end