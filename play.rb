require './game'
require './cards'

game = Game.new()

while game.score > -2
  game.gamePlay
  puts "Player's score = #{game.score}"
end
