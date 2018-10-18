# Creates the deck of 52 cards of values 1 to 52.
class Card
  attr_accessor :deck
  def initialize
    @deck = []
    (1...53).each do |card|
      @deck.push(card)
    end
    puts 'Deck created.'
  end
end

# Game class that manages the card class and two players.
class Game
  attr_accessor :a_name, :a_score, :b_score, :turn
  def initialize(name)
    @a_name = name
    @a_score = 0
    @b_score = 0
    @a_hand = []
    @b_hand = []
    @history = []
    @turn = 1
    puts 'Game init.'
  end

  # Shuffle cards
  def shuffle_deck(cards)
    puts 'Shuffling deck.'
    cards.deck.shuffle!
  end

  # Draw cards and add to player hands
  def deal(cards)
    @a_hand << cards.deck.shift
    puts "#{@a_name} played #{@a_hand}"
    @b_hand << cards.deck.shift
    puts "Banker played #{@b_hand}"
  end

  # Compare drawn cards and assign points. Record hands after
  def compare_hands
    if @a_hand[0] > @b_hand[0]
      @a_score += 1
      @b_score -= 1
    else
      @b_score += 1
      @a_score -= 1
    end
    puts "#{@a_name}: #{@a_score} points, Banker: #{@b_score} points"
    record_hands
  end

  # Record hands played and clear hands
  def record_hands
    record = []
    a = format '%02d', @a_hand.shift
    b = format '%02d', @b_hand.shift
    record << "#{@turn}: #{a} vs #{b}"
    @history << record
  end

  # Print out final game summary
  def report
    puts '*GAME ENDED*'
    puts "#{@a_name} has #{@a_score} points."
    puts "Banker has #{@b_score} points."
    if @a_score > @b_score
      puts "#{@a_name} has won the game!"
    else
      puts 'Banker has won the game!'
    end
    puts '*MATCH HISTORY*'
    @history.each { |item| puts item.join }
  end
end

# Create new card object
cards = Card.new
# Create new game object
puts 'Hi, what is your name?'
name = gets.chomp
if name.strip.empty? ? (name = 'Player') : name
end
play = Game.new(name)
# Shuffle card object with Game class method
play.shuffle_deck(cards)
# Start game at turn 1

# Loop game while player scores not equal -2 or turn more than 26
loop do
  puts "*TURN #{play.turn}*"
  play.deal(cards)
  play.compare_hands
  break if play.a_score == -2 || play.b_score == -2

  puts 'Do you want to continue?'
  break if gets.chomp.include? 'no'

  play.turn += 1
  break if play.turn == 27
end
play.report
