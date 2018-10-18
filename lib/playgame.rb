require 'byebug'

require './cardgame'


play = true
game = Game.new

puts "Welcome! Please enter your name."
player_name = gets.chomp.to_s


while play

  super
  game.play_game
  puts "#{player_name}, your score this round is #{game.score_check}."

  puts "Do you want to play this hand? y/n"
  show = gets.chomp

  if show == "n"
    puts "game ends!"
    play = false
  end

  if game.score_check < -2
    puts "you lose!"
    play = false
  end

end


byebug

puts "hello"