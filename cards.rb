class Cards

    def initialize
        @cards = Array (1..52)
    end


    def show_card
        @cards.shuffle.first
    end

    # def get_card
    #     @cards.shuffle.pop
    # end
end


#######################################################################

class Game

def initialize
    @deck = Cards.new
    @score = 0
    @turn = []
end

def play
    @player = @deck.show_card
    @computer = @deck.show_card


puts "Your card is: #{player.to_s}"


# puts "Computer is: #{computer}"
    # @turn << [player, computer]

    if player > computer
      @score += 1
    else
      @score -= 1
    end
end

def player
    return @player
end

def computer
    return @computer
end

def check_game
    @score
end

end


#######################################################################

playing = true

game = Game.new

while playing

  game.play

puts "current score is: #{game.check_game.to_s}"
puts "do you want to play this turn?"

  answer = gets.chomp
  if answer == "no"
    puts "folding"
    puts "Computer's card is: #{game.computer.to_s}"
    next

else



end



  if game.check_game < -2
    playing = false
    puts "Game Over!"
  end
end