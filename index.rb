class Cards
  def initialize
    @cards = (1..52).to_a
  end

  def show_card
    @cards.shuffle.first
  end

  def get_card
    @cards.shuffle.pop
  end
end

class Game
  def initialize
    @deck = Cards.new
    @score = 100
    @hands = []
    @user_hand = 0
    @house_hand = 0
  end

  def draw
    @user_hand = @deck.show_card
    @house_hand = @deck.show_card

    @hands << [@user_hand, @house_hand]
  end

  def bet
    puts "How much are you betting for this hand?"
    @bet_amt = gets.chomp.to_i
    if @bet_amt > @score
      puts "Sorry, this is more than you current balance in hand"
      bet
    end
  end

    def play
    if @user_hand > @house_hand
      @score = @score + (@bet_amt * 2)
    else
      @score = @score - @bet_amt
    end
  end

  def check_game
    @score
  end

  def showing_user_hand
    @user_hand
  end

    def showing_house_hand
    @house_hand
  end

end

playing = true

game = Game.new

while playing
  game.draw
  puts "Your current picked card number: #{game.showing_user_hand.to_s}"
  puts "do you want to play this hand?"
  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  else
    game.bet
    puts "House's card number: #{game.showing_house_hand.to_s}"
  game.play
  puts "Your current score is: #{game.check_game.to_s}"
  end

  if game.check_game < -2
    playing = false
  end
end
