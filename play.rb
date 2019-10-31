require "./Game"
require "./Card"

playing = true

game = Game.new

while playing
  game.play
  p "Current score is #{game.check_game.to_s}"
  p "Do you want to play this hand?"

  answer = gets.chomp
  if answer == "no"
    p "folding"
    next
  end

  if game.check_game < -2
    playing = false
    p "GAME OVER! YOU LOST!!!"
  end
end
