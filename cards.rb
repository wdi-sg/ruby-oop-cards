class Cards
  def initialize
    @cards = (1..52).to_a.shuffle
  end

  def get_card
    # shuffle and get the first number
    @cards.first
  end

  def delete_card
    # delete the number from the deck so cannot use anymore
    @cards.shift
  end

end

# deck = Cards.new
# puts "befoooorrreee  "
# p deck

# deck.get_card
# deck.delete_card

# puts "afterrr "
# p deck

# deck.delete_card
# p deck

class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hand_array = []
  end

  def play
    p @deck
    @player_card = @deck.get_card
    @hand_array << @player_card
    @deck.delete_card

    @comp_card = @deck.get_card
    @hand_array << @comp_card
    @deck.delete_card

    p @hand_array

    if @player_card > @comp_card
      @score += 1
    else
      @score -= 1
    end
  end

  def total_score
    @score
  end
end



##### PLAY TIME #####

game = Game.new
#game.play
#game.total_score
current_score = game.total_score

  puts "Enter your name: "
  player = gets.chomp
  puts "Hello #{player}!"

  while true
    puts "You have #{current_score} points.\n1: Play\n2: End Game"
    choice = gets.chomp.to_i

    if choice == 1
      game.play
      current_score = game.total_score

      if current_score == -2
        puts "You lost the game!"
        break
      end

    elsif choice == 2
      puts "Your final score is #{current_score}!"
      break;
    end
  end