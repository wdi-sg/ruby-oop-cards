require './game'
require './card'

playing = true

game = Game.new

puts "What is your name?"
player = gets.chomp

while playing



  game.drawMyCard
  puts "Do you want to play this hand?"

  answer = gets.chomp
  if answer == "no"
    puts "\nYou have folded\n"
    next
  elsif answer == "yes"
    puts "How much will you bet?"
    bet = gets.chomp
    puts "\nThe house will now draw\n"
    game.start(bet)
  end

  puts "\n#{player}'s score: #{game.check.to_s}"

  if game.check <= -5
    puts "\nYou lose!"
    playing = false
  elsif game.check >= 5
    puts "\nYou win!"
    playing = false
  end

end