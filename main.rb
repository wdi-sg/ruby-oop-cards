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
  # player draw a card
  player_card = game.draw_card
  player_current_score = game.player.score

  # dealer draw a card
  dealer_card = game.draw_card

  if player_card > dealer_card
    game.player.set_score(player_current_score + 1)
  else
    game.player.set_score(player_current_score - 1)
  end

  puts "player card: #{ player_card } vs dealer_card: #{ dealer_card }"

  puts "#{ player_name }, do you still want to continue the game (Y/N)?"
  continue = gets.chomp

  if (continue == "N")
    game.game_score
    break
  end

end

puts "Game end!"