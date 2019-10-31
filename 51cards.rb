class Cards

    def initialize
        @cards = Array (1..52)
    end


    def show_card
        @cards.shuffle.first
    end

end


class Game

def initialize
    @deck = Cards.new
    @score = 0
    @computerScore = 0
    @turn = []
end

def play
    @player = @deck.show_card
    @computer = @deck.show_card


puts "Your card is: #{player.to_s}"


puts "Computer is: #{computer}"

    if player > computer
      @score += 1
      @computerScore -= 1
    else
      @score -= 1
      @computerScore += 1
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
    @computerScore
end

end


playing = true

game = Game.new

while playing

  game.play

puts "Your current score is: #{game.check_game.to_s}"
# puts "The computer's score is: #{game.check_game.to_s}"

# if game.check_game.to_s > 

puts "Do you want to play this round?"

  answer = gets.chomp
#   add a way to exit the game....
  if answer == "q"
  playing = false
  end   

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