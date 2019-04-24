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

until game.game_end? == true
  game.play_game(game.place_bet())

  puts "#{ game.player.name }, do you want to fold the game (Y)?"
  continue_game = gets.chomp

  if (continue_game == "Y")
    game.game_score
    break
  end

end