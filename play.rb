require './game'
require './cards'

playing = true

puts "Enter name"

name = gets.chomp

game = Game.new(name)

while playing

  game.play
  puts "#{game.name}, Your current score is: #{game.check_game.to_s}"

  puts "do you want to play this hand?"

  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  elsif answer == "yes"
    puts "playing hand"
    next
  else
    puts "input invalid"
  end

  if game.check_game < -2
    playing = false
  end
end
