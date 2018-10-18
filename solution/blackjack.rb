require 'byebug'

$cash = 400

class Game
  attr_accessor :shoe, :hit, :playing, :bet, :decision, :start

  def initialize
    @bet = 0
    @playing = true

    @deck = [1,2,3,4,5,6,7,8,9,10,10,10,10]
    @shoe = @deck * 32

    # i = 0
    # @shoe = []
    # while true do
    #   @shoe = @shoe + deck
    #   i + 1
    #   break if i > 32
    # end

    @shoe = @shoe.shuffle
    puts "Shuffle up and deal!"
    bet
  end; 0

  def hit
    @shoe.slice!(0,1)
  end

  def bet
    puts "How much would you like to wager?"
    @wager = gets.chomp.to_f
    while @wager > $cash
      puts "You have insufficient cash! Please gamble responsibly you have #{$cash} how much would you like to bet?"
      @wager = gets.chomp.to_f
    end
    puts "No more bets!"
    @playing = true
    start
  end

  def start
    $player_hand = []
    $banker_hand = []

    # 2 cards for player 1 card for banker
    $player_hand = $player_hand + hit

    $banker_hand = $banker_hand + hit

    $player_hand = $player_hand + hit

    puts "Your hand is #{$player_hand} vs banker's #{$banker_hand}"

    decision
  end

  def decision

    if $banker_hand.sum > 21 && @playing == false
      $cash = $cash + @wager
      print '1'
      puts "You won! You now have #{$cash}. Quit while you're ahead brah"
    end

    if $banker_hand.sum < 21 && @playing == false
      checkState
    end

    if $player_hand.sum > 21 && @playing == true
      $cash = $cash - @wager
      puts "You have #{$player_hand}. You busted noob. You have #{$cash} left. Play again? y/n"
      @decision = gets.chomp
      if @decision == 'n'
        @playing = false
      elsif @decision == 'y'
        bet
      end
    end

    if ( $player_hand == [1,10] || $player_hand == [10,1] ) && $player_hand.length == 2
      $cash = $cash + @wager*1.5
      puts "BLACK JACK! Winner winner chicken dinner your current stash is #{$cash}"
      bet
    elsif @playing == true
      puts "Your current hand is #{$player_hand} vs the banker's #{$banker_hand}. What will you do? hit / stand / DOUBLEDOWN ?"
      @decision = gets.chomp
      if @decision == 'hit'
        fight
      elsif @decision == 'stand'
        stand
      elsif @decision == 'DOUBLEDOWN'
        if @wager > $cash / 2
          puts "Insufficient cash to doubledown!"
          decision
        else
          doubleDown
        end
      end
    end

  end

  def fight
    $player_hand = $player_hand + hit
    decision
  end

  def stand
    while $banker_hand.sum < 17
      $banker_hand = $banker_hand + hit
    end
    @playing = false
    checkState
  end

  def checkState
    if $banker_hand.sum > 21
      $cash = $cash + @wager
      print '2'
      puts "Banker has busted with #{$banker_hand} totalling #{$banker_hand.sum}! You won with #{$player_hand} You have #{$cash}. Would you like to play again? y / n"
      another
    elsif $player_hand.sum > $banker_hand.sum
      $cash = $cash + @wager
      print'3'
      puts "Your #{$player_hand} total = #{$player_hand.sum} has won the banker's #{$banker_hand} of #{$banker_hand.sum}! You have #{$cash}. Quit while you're ahead brah. Would you like to play again? y / n"
      another
    elsif $player_hand.sum == $banker_hand.sum
      puts "Your #{$player_hand} total = #{$player_hand.sum} has drawn the banker's #{$banker_hand} of #{$banker_hand.sum}! You have #{$cash}. Quit while you're ahead brah. Would you like to play again? y / n"
      another
    elsif $banker_hand.sum > $player_hand.sum
      $cash = $cash - @wager
      puts "Your #{$player_hand} total = #{$player_hand.sum} has lost to the banker's #{$banker_hand} of #{$banker_hand.sum}! You have #{$cash}. Quit while you can brah. Would you like to play again? y / n"
      another
    end
  end

  def another
    @decision = gets.chomp
    if @decision == 'y'
      @playing = true
      bet
    else
      puts "You have #{$cash} cash! Thank you for playing"
    end
  end

  def doubleDown
    @wager = @wager * 2
    $player_hand = $player_hand + hit
    if $player_hand.sum > 21
      puts 'You busted with #{$player_hand}. Would you like to play again? y / n'
      @decision = gets.chomp
      if @decision == 'y'
        bet
      else
        puts "You have #{$cash} cash! Thank you for playing"
      end
    end
    stand
  end

  # def hit
  #   $player_hand = $player_hand + hit
  # end

end

puts 'hello'

casino_boyz = Game.new







