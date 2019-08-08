class Cards
  def initialize
    @deck = []
    i = 1
    while i <=52
    @deck.push(i)
    i=i+1
    end
  end
  def check_cards
    p @deck
  end
  def draw_card
    @deck.shuffle.first
  end
end

class Game
  def initialize(name)
    @name = name
    @deck = Cards.new
    @player_hand = []
    @com_hand = []
    @score = 10
  end
  def name
    @name
  end
  def score
    @score
  end
  def player_hand
    puts "your cards are: #{@player_hand}"
  end
  def com_hand
    puts "com cards are #{@com_hand}"
  end
  def clear_hand
    @player_hand.clear
    @com_hand.clear
  end
  def playing
    player_turn = @deck.draw_card
    puts "player 1st card #{player_turn}"
    com_turn = @deck.draw_card
    puts "com 1st card #{com_turn}"
    player_turn = @deck.draw_card
    puts "player 2nd card #{player_turn}"
    com_turn = @deck.draw_card
    puts "com 2nd card #{com_turn}"
    @player_hand << [player_turn, player_turn]
    puts "player cards #{@player_hand}"
    @com_hand << [com_turn, com_turn]
    puts "com cards #{@com_hand}"

    if @player_hand.inject(:+) > @com_hand.inject(:+)
      @score = @score + 1
    else
      @score = @score - 1
    end
  end
end

puts "Whats your name"
username = gets.chomp
game = Game.new(username)
puts "Hello #{game.name}, you have 10 points, input start to play"

answer = gets.chomp

if answer == "start"
gameOn = true

end

while gameOn

  game.playing
  game.player_hand
  game.com_hand

  puts "Continue game??"

  answer = gets.chomp

  if answer == "yes"

    game.clear_hand

  elsif game.score < -2 || answer == "end"
    puts "game over"
    gameOn = false
  end
end