require('byebug')

class Card

  attr_accessor :cards

  def initialize
    puts 'creating deck'
    @cards=[]
    for i in 1..52
      @cards << i
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.shift
  end

end


class Game

  attr_accessor :player_one
  attr_accessor :player_two
  attr_accessor :points
  attr_accessor :hands
  attr_accessor :deck
  attr_accessor :round
  attr_accessor :continue
  attr_accessor :bet





  def initialize
    puts 'creating game'
    @deck = Card.new
    #shuffle cards
    @deck.shuffle
    # puts @deck.cards

    @round = 0
    @player_one = nil
    @player_two = nil
    @points = 1000
    @hands = []
    @continue = "yes"
    @bet = 1

  end

  def draw_two
    @round += 1

    puts "drawing 2 cards"

    @player_one = @deck.deal
    @player_two = @deck.deal

  end

  #takes in an integer to compare
  def compare (player_one, player_two)

    puts "comparing 2 cards"


    if @player_one > @player_two
      puts 'Player one wins'
      @points += @bet
    else
      puts 'Player two wins'
      @points -= @bet
    end
  end

  def continue_game
    puts 'Continue Game? (y/n)'
    @continue = gets.chomp
  end

  def bet
    puts 'How much would you like to bet'
    @bet = gets.chomp.to_i
  end

end

# game_one = Game.new(deck)

# # create a new deck
# deck = Card.new

# #shuffle cards
# deck.shuffle

game_one = Game.new


loop do

  puts "This is round #{game_one.round}"

  game_one.bet
  game_one.draw_two
  puts game_one.deck.cards.length

  game_one.compare(@player_one, @player_two)

  puts "hello you have #{game_one.points} dollars"

  game_one.continue_game

  break if game_one.deck.cards.length == 0 or game_one.points <-2 or game_one.continue == 'n'
end









