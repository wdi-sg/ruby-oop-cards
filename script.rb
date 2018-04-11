require 'byebug'

class Card
  attr_accessor :suit
  attr_accessor :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
end

# class Cards
#   attr_accessor :deck
#   def initialize
#     suits = ["clubs", "diamonds", "hearts", "spades"]
#     values = ["2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]
#     @deck = []
#
#     values.each { |value|
#       suits.each { |suit|
#         @deck << Card.new(suit, value)
#       }
#     }
#   end
#
#   def draw_card
#     @deck.shuffle!.pop
#   end
# end

class Game
  attr_accessor :deck
  attr_accessor :p1_points
  attr_accessor :p2_points
  attr_accessor :hands_played
  attr_accessor :p1_bet
  attr_accessor :p1_odds
  def initialize(player_one, player_two)
    suits = ["clubs", "diamonds", "hearts", "spades"]
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]
    @deck = []

    values.each { |value|
      suits.each { |suit|
        @deck << Card.new(suit, value)
      }
    }
    @p1_points = 0
    @p2_points = 0
    @hands_played = []
    @p1_bet = 0
    @p1_odds = 0
  end

  def draw_card
    @deck.shuffle!.pop
  end

  def calculate_odds(score)
    points = [-1, 0, 1]
    odds = [2, 1, 0.5]
    position = points.index(score)
    odds[position]
  end

  def compare_card(a, b)
    suits = ["clubs", "diamonds", "hearts", "spades"]
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]
    puts a
    if values.index(a.value) > values.index(b.value)
      return a
    elsif values.index(a.value) < values.index(b.value)
      return b
    elsif suits.index(a.suit) > suits.index(b.suit)
      return a
    else
      return b
    end
  end
end

game1 = Game.new("alice", "bob")

gamestate = true

while (game1.p1_points > -2 and game1.p2_points > -2 and gamestate == true) do
  puts "Do you want to continue?"
  input = gets.chomp
  if input == "no"
    gamestate = false
    break
  end

  if game1.p1_bet == 0
    odds = game1.calculate_odds(game1.p1_points)
    puts "The current payout ratio is #{odds}. Enter a bet amount (Enter 0 if you don't want to bet)"
    input = gets.chomp
    game1.p1_bet = input.to_i
    if input != 0
      game1.p1_odds = odds
    end
  end

  puts "drawing card"
  p1 = game1.draw_card
  p2 = game1.draw_card

  results = game1.compare_card(p1, p2)


  if results == p1
    game1.p1_points += 1
    game1.p2_points += -1
  else
    game1.p2_points += 1
    game1.p1_points += -1
  end
  game1.hands_played << [p1, p2]
  puts "p1 score: #{game1.p1_points}"
  puts "p2 score: #{game1.p2_points}"
end


if game1.p1_points == 2
  puts "you won #{game1.p1_bet * game1.p1_odds}"
else
  puts "you lose #{game1.p1_bet}"
end

byebug

puts "hello"
