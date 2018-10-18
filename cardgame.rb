require 'byebug'

class Deck

  attr_reader :cards

  def initialize
    @cards = (1..52).to_a

  end
end

class Game

  attr_reader :deck
  attr_reader :handrecord
  attr_reader :score

  def initialize
    @deck = Deck.new.cards.shuffle
    @handrecord = []
    @score = 0
  end

  def gameturn
    playercard = @deck[0]
    housecard = @deck[1]
    @handrecord += [@deck[0, 2]]
    @deck -= @deck[0, 2]

    puts "You drew a #{playercard} to the dealer's #{housecard}."

    if playercard > housecard
      @score += 1
      puts "(+1 point)"

    elsif playercard < housecard
      @score -= 1
      puts "(-1 point)"
    end
  end
end

def initgame

  puts 'Welcome. What is your name?'
  playername = gets.chomp

  loop do
    puts 'Shuffling deck and starting new game.
    Dealing cards...'
    newgame = Game.new

    loop do

      newgame.gameturn

      puts "#{playername}, you have #{newgame.score} point(s)."

      if newgame.score < -2
        break puts 'Game Over!'
      elsif newgame.deck.empty?
        break puts 'No cards left to deal.'
      else
        puts 'Do you wish to continue playing?'
        cont = gets.chomp.downcase
        if cont == 'no' || cont == 'n'
          break
        end
      end
    end

    puts "Your final score is #{newgame.score}.
    Hands played (Your card, Dealer's card): #{newgame.handrecord}
    Would you like to play again?"

    reply = gets.chomp.downcase

    if reply != 'yes' && reply != 'y'
      return
    end
  end
end


initgame





