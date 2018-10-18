require 'byebug'
require 'rubocop'

class Card
  attr_accessor :card

  def initialize
    @card = [*1..52].shuffle
  end

  def draw_card
    @card.shift
  end
end


class Game
  attr_accessor :deck
  attr_accessor :score
  attr_accessor :hand


  def initialize (name)
    @name = name
    @deck = Card.new
    @score = 0
    @hand = []
  end

  def play
    player_hand = @deck.draw_card
    banker_hand = @deck.draw_card

    puts "#{@name} drew #{player_hand}"
    puts "The banker drew #{banker_hand}"

    @hand << [player_hand, banker_hand]

    if player_hand > banker_hand
      @score += 1
      puts "Congratulations #{@name}, you have +1 point. Your score is #{@score}"
    else
      @score -= 1
      puts "Oh no #{@name}, you lost 1 point. Your score is #{@score}"
    end
  end
end


loop do
puts "Please enter your name"
reply = gets.chomp
game = Game.new(reply)

puts "Welcome #{reply}, dealing cards...."

  loop do
    game.play

    puts "Do you want to continue with the game? [Y/N]"
    continue = gets.chomp

    if game.score < -2
      break puts 'Game Over'
    elsif game.deck.card.size == 0
      break puts 'No more cards to deal'
    elsif continue == "N"
      break puts 'Thank you for playing'
    end

  end

  puts "Your final score is #{game.score}"
  puts "Hands played : #{game.hand}"

  puts "Would you like to play again? [Y/N]"
  reply = gets.chomp

  if reply == 'N'
    break puts 'Thank you for playing #{reply}'

  end
end


byebug
puts 'byebug'