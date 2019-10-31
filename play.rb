require "./Game"
require "./Card"

playing = true

p "What is your name?"
myname = gets.chomp

game = Game.new(myname)

while playing
  game.play

  p "Current score is #{game.check_game.to_s}"
  p "Do you want to play this hand?"

  answer = gets.chomp
  if answer == "no"
    p "folding"
    p "Do you wish to continue?"
    continueAnswer = gets.chomp
    if continueAnswer == "no"
      p "See ya! Your score is #{game.check_game}"
      playing = false
      # next
    end
  end

  if game.check_game < -2
    playing = false
    p "GAME OVER! YOU LOST!!!"
  end
end
