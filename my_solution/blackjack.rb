require 'byebug'

#https://gist.github.com/ctorok/4243004

$suits = ['Clubs', 'Diamonds', 'Hearts', 'Spade']
$ranks = [*1..13]

class Card
  attr_accessor :suit, :rank
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    return case @rank.to_i
      when 1
        11
      when 11..13
        10
      else
        @rank
    end
  end

  def display
    return case @rank.to_i
      when 11
        "Jack"
      when 12
        "Queen"
      when 13
        "King"
      when 1
        "Ace"
      else
        @rank
    end
  end

  def statement
    return "#{display} of #{@suit}"
  end

end

class Deck
  attr_accessor :deck
  def initialize
    @deck = []
    $suits.each do |suit|
      $ranks.each do |rank|
        @deck.push(Card.new(suit, rank))
      end
    end
    @deck.shuffle!
  end

  def draw_card
    return @deck.pop
  end

end

class Player
  attr_accessor :name, :hand, :hand_value
  def initialize(name)
    @name = name
    @hand = []
    @hand_value = 0
  end

  def statement
    output_string = "#{@name}'s current hand: "
    @hand.each do |card|
      output_string += card.statement + ', '
    end
    output_string += "and the total value is: " + @hand_value.to_s
    return output_string
  end
end

puts "Hi! Play Black Jack. What's your name?"
guest_name = gets.strip

running = true
while running
  deck = Deck.new
  guest = Player.new(guest_name.capitalize)
  dealer = Player.new("Dealer")

  # give out cards in turn
  (1..2).each do |times|
    [guest, dealer].each do |player|
      current_card = deck.draw_card
      player.hand << current_card
      player.hand_value += current_card.value
    end
  end

  if guest.hand_value == 21 && dealer.hand_value == 21
    print "Both you and dealer Black Jack."
    play_again = gets.strip
  elsif guest.hand_value == 21
    print "You Black Jack!"
    play_again = gets.strip
  elsif dealer.hand_value == 21
    print "Dealer Black Jack!"
    play_again = gets.strip
  else
    draw = true
    while draw
      puts guest.statement
      print "Would you like to draw? (y/n) "
      input = gets.strip
      if input == "y"
        current_card = deck.draw_card
        guest.hand << current_card
        guest.hand_value += current_card.value
      elsif input == 'n'
        draw = false
      else
        puts "Please enter only y or n."
      end
    end
    while dealer.hand_value < 17
      current_card = deck.draw_card
      dealer.hand << current_card
      dealer.hand_value += current_card.value
    end
    puts dealer.statement
    puts "----------------"
    if guest.hand_value > 21 && dealer.hand_value > 21
      puts "No one wins"
    elsif guest.hand_value > dealer.hand_value
      puts "Results: " + guest.name + " wins!"
    else
      puts "Results: Dealer wins!"
    end
  end
  puts "Would you like to play again? (y/n) "
  input = gets.strip
  if input == "n"
    running = false
  end
end
