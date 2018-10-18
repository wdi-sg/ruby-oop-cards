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
  attr_accessor :player_name, :score, :turn
  def initialize(name)
    @name = name
    @score = 0
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
    puts "*TURN #{@turn}*"
    @a_hand << cards.deck.shift
    puts "#{@name} played #{@a_hand}"
    @b_hand << cards.deck.shift
    puts "Banker played #{@b_hand}"
  end

  # Compare drawn cards and assign points. Record hands after
  def compare_hands
    if @a_hand[0] > @b_hand[0] ? (who = @name) : (who = 'Banker')
    end
    who
  end

  def determine(who)
    if who == 'Banker' ? @score -= 1 : @score += 1
      puts "#{who} wins the round."
      puts "#{@name}, you have #{@score} points."
    end
    record_hands
  end

  def wager(who, bet)
    if who == 'Banker' ? @score -= bet : @score += bet
      puts "#{who} wins the round."
      puts "#{@name}, you have #{@score} points."
    end
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
    puts "#{@name} has #{@score} points."
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
  play.deal(cards)
  puts play.compare_hands
  play.determine(play.compare_hands)
  break if play.score == -2

  puts 'Do you want to continue?'
  break if gets.chomp.include? 'no'

  while play.score >= 2
    puts 'Do you want to wager your score?'
    answer = gets.chomp
    if answer != 'yes'
      puts 'You chose not to wager. Game proceeds.'
      break
    end
    puts "You can wager additional #{play.score - 1} point(s), Bet: "
    wager = gets.chomp.to_i
    puts "You bet 1 + #{wager}" unless wager.nil?
    play.deal(cards) unless wager.nil?
    play.wager(play.compare_hands, wager) unless wager.nil?
  end
  play.turn += 1
  break if play.turn == 27
end
play.report
