# require 'byebug'

# class Cards

#   def initialize
#     @cards = []
#     i = 1
#     while true do; 0
#       @cards << i
#       i = i + 1; 0
#       break if i > 52
#     end; 0

#     # puts @cards

#   end

#   def get_card
#     @cards = @cards.shuffle
#     @cards = @cards.drop(1)
#     card = @cards.first
#   end

# end

# class Game

#   def initialize

#     @deck = Cards.new
#     @score = 0
#     @hands = []

#   end

#   def play

#     house_card = @deck.get_card
#     player_card = @deck.get_card

#     @hands << player_card

#     puts "Your card is #{player_card}, do you want to play this hand? y/n"

#     answer = gets.chomp

#     if answer == 'y'
#       if player_card > house_card
#         puts "Your card is #{player_card} which is higher than #{house_card}, you won! Your current score is:"
#         @score = @score + 1
#       else
#         puts "Your card is #{house_card} which is higher than #{player_card}, you lost... Your current score is:"
#         @score = @score - 1
#       end
#     elsif answer == 'n'
#     end

#   end

#   def current_score
#     return @score
#   end

# byebug

# end

# playing = true
# game = Game.new
# while playing

#   game.play
#   puts "current score is #{Game.current_score.to_s}"

#   puts "do you still want to play?"

#   reply = gets.chomp

#   if reply == 'y'
#     game.play
#   elsif reply == 'n'
#     playing = false
#   end
# end


























