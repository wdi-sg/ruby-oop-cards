require 'byebug'
require 'rubocop'


puts "Ruby is alive"

class Card
  def initialize
    # init will create cards of val 1-52
    @cards = (1..52).to_a
  end

  def show_card
    @cards.shuffle.first
  end

  def draw_card
    @cards.shuffle.pop
  end
end

class Game
  def initialize
    #get new deck
    @deck = Card.new
    @score = 0
    @hand = [@player_hand, @ai_hand]
  end

  def play
    @player_hand = @deck.draw_card
    @ai_hand = @deck.draw_card
    @player_hand > @ai_hand? @score+=1 : @score-=1
    puts "player: #{@player_hand}"
    puts "ai: #{@ai_hand}"
  end

  def check_game
    @score
  end
end



  playing = true

  tryout = Game.new

  while playing
      tryout.play
      puts "Hi player, your current score is #{tryout.check_game.to_s}"

      puts "Do you want to play this hand? (Y/N)"

      choice = gets.chomp

      if choice == "N"
        puts "Folding Card"
        next
      end



      if tryout.check_game < -2
        playing false
      end
  end


byebug
puts "end"
