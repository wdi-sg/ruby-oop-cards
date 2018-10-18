class Cards
  attr_accessor :number
  attr_accessor :value
  attr_accessor :suite

  def initialize(number, value, suite)
    @number = number
    @value = value
    @suite = suite
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
  end

  def populate
    suite = ['hearts', 'diamonds', 'spade', 'clubs']
    number = [2,3,4,5,6,7,8,9,10,'Jack', 'Queen', 'King', 'Ace']
    suite.each do |suite|
      number.each do |number|
        if number.is_a?(String)
          if number == 'Ace'
            @card = Cards.new(number, [1,11], suite)
            @deck << @card
          else
            @card = Cards.new(number, 10, suite)
            @deck << @card
          end
        else
            @card = Cards.new(number, number, suite)
            @deck << @card
        end
      end
    end
    @deck.shuffle!
  end

end

class Game
  attr_accessor :deck
  attr_reader :dealer_hand
  attr_reader :player_hand

  def initialize
    @deck = Deck.new
    @deck.populate
    @dealer_hand = []
    @player_hand = []
  end

  def show_hand
    @player_hand.each do |card|
      puts "card: #{card.number} #{card.suite}"
    end
  end

  def deal
    for i in 0...2
      @player_hand << @deck.deck.shift
      @dealer_hand << @deck.deck.shift
    end
  end

  def hit
    @player_hand << @deck.deck.shift
  end

  def dealer_logic
    @dealer_hand << @deck.deck.shift
  end

  def check
    dealer_score = 0
    player_score = 0
    player_ace = []
    dealer_ace = []
    @player_hand.each do |card|
      if card.value.is_a?(Array)
        player_ace << card
      else
        player_score += card.value
      end
    end
    if player_ace.length > 0
      player_ace.each do |card|
        if player_score > 10
          card.value = 1
          player_score += card.value
        else
          card.value = 11
          player_score += card.value
        end
      end
    end

  @dealer_hand.each do |card|
      if card.value.is_a?(Array)
        dealer_ace << card
      else
        dealer_score += card.value
      end
    end
    if dealer_ace.length > 0
      dealer_ace.each do |card|
        if dealer_score > 10
          card.value = 1
          dealer_score += card.value
        else
          card.value = 11
          dealer_score += card.value
        end
      end
    end
    $dealer_score = dealer_score

    if player_score > 21
      puts "Ooh Busted!"
      $playing = false
    end

    if $playing == false && $dealer_done == true
      if (player_score > dealer_score && player_score < 21) || player_score == 21 || dealer_score > 21
        puts "Your score: #{player_score} \nDealer score: #{$dealer_score} \nYou Won!"
      elsif player_score == dealer_score
        puts "Your score: #{player_score} \nDealer score: #{$dealer_score} \nIts a tie!"
      else
        puts "Your score: #{player_score} \nDealer score: #{$dealer_score} \nYou Lost!"
      end
    end
  end
end

$playing = true
$dealer_score = 0
$dealer_done = false

puts 'Welcome to a game of blackjack!'
new_game = Game.new
new_game.deal
new_game.show_hand

while $playing == true
  if new_game.player_hand.length == 5
    $playing = false
    while $dealer_score < 15 && new_game.dealer_hand.length < 5
      new_game.check
      if $dealer_score < 15
        new_game.dealer_logic
      end
    end
    $dealer_done = true
    new_game.check
  else
    puts 'Do you want another card? (y/n)'
    reply = gets.chomp
    if reply == 'y'
      new_game.hit
      new_game.show_hand
      new_game.check
    else
      $playing = false
      while $dealer_score < 15 && new_game.dealer_hand.length < 5
        new_game.check
        if $dealer_score < 15
          new_game.dealer_logic
        end
      end
      $dealer_done = true
      new_game.check
    end
  end
end




















