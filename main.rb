class Card
  def initialize(value)
    @value = value
  end

  def value
    @value
  end
end

class Deck
  def initialize
    count = 0
    cards = []
    52.times do
      count += 1
      card = Card.new(count)
      cards << card
    end
    @cards = cards
  end

  def cards
    @cards
  end
end

class Player
  def initialize(name)
    @hand = []
    @points = 0.to_i
    @name = name
    @bet
  end

  def hand
    @hand
  end

  def points
    @points
  end

  def set_points(x)
    @points = @points + x
  end

  def bet
    @bet
  end

  def set_bet(amount)
    @bet = amount.to_i
  end

  def name
    @name
  end
end

class Game
  def initialize
    deck = Deck.new
    deck.cards.shuffle!
    @betting_player
    @deck = deck
    puts "Player 1, what is your name?"
    @player_1 = Player.new(gets.chomp)
    puts "Player 2, what is your name?"
    @player_2 = Player.new(gets.chomp)
    @turn = 0
  end

  def draw_cards
    @player_1.hand << @deck.cards.slice!(0)
    puts @player_1.name + " drew: " + @player_1.hand[@turn].value.to_s
    @player_2.hand << @deck.cards.slice!(0)
    puts @player_2.name + " drew: " + @player_2.hand[@turn].value.to_s
    if @player_1.hand[@turn].value > @player_2.hand[@turn].value
      @player_1.set_points(@player_1.bet)
      @player_2.set_points(-@player_2.bet)
    else
      @player_2.set_points(@player_2.bet)
      @player_1.set_points(-@player_1.bet)
    end
    puts @player_1.name + "\'s point total is: " + @player_1.points.to_s
    puts @player_2.name + "\'s point total is: " + @player_2.points.to_s
    @turn += 1
  end

  def place_bets
    puts @player_1.name + ", how much would you like to bet?"
    @player_1.set_bet(gets.chomp)
    puts @player_2.name + ", how much would you like to bet?"
    @player_2.set_bet(gets.chomp)
  end

  def end
    puts @player_1.name + " has " + @player_1.points.to_s + " points"
    puts @player_2.name + " has " + @player_2.points.to_s + " points"
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end
end

game = Game.new
puts "Game Start, press Enter to draw cards:"
continue = "yes"
while game.player_1.points > -10 && game.player_2.points > -10 && continue != "no"
  puts "Type \'no\' if you would like to end the game"
  continue = gets.chomp
  if continue == "no"
    game.end
  else
    game.place_bets
    game.draw_cards
  end
  if game.player_1.points < -10
    puts game.player_2.name + " won!"
  elsif game.player_2.points < -10
    puts game.player_1.name + " won!"
  end
end
