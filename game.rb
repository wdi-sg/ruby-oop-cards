require 'byebug'
require './cards'


class Game
  #why can't i use the inheritance method to get the draw_card method?
  attr_accessor :score, :bet

  def initialize
    super
    @deck = Card.new
    @score = 0
  end

  def gamePlay (bet)
    @bet = bet
    player_card = @deck.draw_card
    puts "Player drew #{player_card}"

    opponent_card = @deck.draw_card
    puts "Player drew #{opponent_card}"

    if player_card > opponent_card
      @score += 1
      bet += 1000
      puts "Your current money contains #{bet}"
    else
      @score -= 1
      bet -= 1000
      puts "Your current money contains #{bet}"
    end
  end

end