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
    puts 'How much would you like to buy in for ($)?'
    @score = gets.chomp.to_i
  end

  def gameturn

    loop do
      puts 'How much would you like to wager on this round ($)?'
      @wager = gets.chomp.to_i

      if @wager > @score
        puts "You don't have that much. Try again."
      elsif @wager <= @score && @wager > 0
        break
      end
    end

    playercard = @deck[0]
    housecard = @deck[1]
    @handrecord += [@deck[0, 2]]
    @deck -= @deck[0, 2]

    puts "You drew a #{playercard} to the dealer's #{housecard}."

    if playercard > housecard
      @score += @wager
      puts "(+$#{@wager})"

    elsif playercard < housecard
      @score -= @wager
      puts "(-$#{@wager})"
    end
  end
end

def initgame

  puts 'Welcome. What is your name?'
  playername = gets.chomp

  loop do

    newgame = Game.new

    puts 'Shuffling the deck and starting a new game.

    Dealing cards...'

    loop do

      newgame.gameturn

      puts "#{playername}, you have $#{newgame.score}."

      if newgame.score <= 0
        break puts "You've lost your buy-in! Game Over."
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

    puts "You cashed out $#{newgame.score}.
    Hands played (Your card, Dealer's card): #{newgame.handrecord}
    Would you like to play again?"

    reply = gets.chomp.downcase

    if reply != 'yes' && reply != 'y'
      return
    end
  end
end


initgame





