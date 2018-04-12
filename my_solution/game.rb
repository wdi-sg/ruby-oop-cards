require './deck.rb'
require 'byebug'

class Game

  def initialize(player1)
    @deck = Deck.new
    @deck.cards.shuffle!
    @player1 = {name: player1, hand: 0, score: 0}
    @player2 = {name: "AI", hand: 0, score: 0}
  end

  def reach_2_first
    
    while @player1[:score] != 2 && @player2[:score] != 2
      @deck.draw_card(@player1)
      print "Do you want to play? (y/n) "
      answer = gets.strip
      if answer == "n"
        @player2[:score] == 2
        puts "Game Over"
        break
      end
      
      @deck.draw_card(@player2)
      print "------------\n"

      @deck.check_hand(@player1, @player2)
    end

    if @player1[:score] > @player2[:score]
      print "#{@player1[:name]} won. Score: #{@player1[:score]} - #{@player2[:score]}\n"
    else
      print "#{@player2[:name]} won. Score: #{@player2[:score]} - #{@player1[:score]}\n"
    end

  end

  def black_jack

  end

end

puts "What is your name?"
player1 = gets.strip

game1 = Game.new(player1)
game1.reach_2_first

game2 = Game.new(player1)
game2.black_jack

