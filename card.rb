require 'byebug'

NUMBER = ("1".."13").to_a
SUITS = [" of Spades", " of Hearts", " of Clubs", " of Diamonds"]

RANK = NUMBER.map do |n|
  if n == "1" then n = "Ace"
  elsif n == "11" then n = "Jack"
  elsif n == "12" then n = "Queen"
  elsif n == "13" then n = "King"
  else n = n
  end
end

@deck = []
@deck = @deck << RANK.collect { |x| x + SUITS.each }

# class Cards
#   def initialize
#     @deck = []
#   end

#   def make_deck
#     @deck = @deck << RANK.collect { |x| x + SUITS}
#   end

# end

byebug

puts "Hello"

