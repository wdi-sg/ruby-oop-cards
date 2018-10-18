require './cards'
require './game'

game = Game.new

puts 'Enter your name:'
player = gets.chomp

loop do
  puts "Hello #{player}, you have #{game.score} points."
  break if game.number_of_cards.zero?

  if game.score < -2
    puts 'Game Over'
    break
  end

  puts 'Enter any key to continue. Enter q to quit.'
  choice = gets.chomp
  break if choice == 'q'

  game.play
end
