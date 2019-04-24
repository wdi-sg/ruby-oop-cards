require './cards'
require './player'
require './game'

puts "What is your name?"
player_name = gets.chomp.capitalize

puts "Hello #{ player_name }, you have 10 points!"

cards = Cards.new()
player = Player.new(player_name, 10)
dealer = Player.new("Dealer", 0)

game = Game.new(cards, player, dealer)

until game.game_end?

  game.play_game()

  puts "#{ player_name }, do you still want to fold the game (Y)?"
  continue_game = gets.chomp

  if (continue_game == "Y")
    game.game_score
    break
  end

end

puts "Game end!"