require './game'
require './cards'

game = Game.new()
puts "Please enter your name: "
input = gets.chomp
while game.score > -2
  game.gamePlay
  puts "hello #{input}, you have #{game.score} points."
end
