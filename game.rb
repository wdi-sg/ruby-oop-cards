require 'byebug'
require './cards'


class Game
  #why can't i use the inheritance method to get the draw_card method?
  attr_accessor :score

  def initialize
    super
    @deck = Card.new
    @score = 0
  end

  def gamePlay
    player_card = @deck.draw_card
    puts "Player drew #{player_card}"

    opponent_card = @deck.draw_card
    puts "Player drew #{opponent_card}"
    if player_card > opponent_card
      @score += 1
    else
      @score -= 1
    end
  end

end