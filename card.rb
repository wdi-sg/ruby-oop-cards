require 'byebug'

class Card
  #attr_accessor :patientID
  attr_accessor :cards
  
  def initialize
    @cards = (1..52).to_a.shuffle!
  end 
end


class Game < Card
  attr_accessor :played
  attr_accessor :score
  
  def initialize
    super()
    @played = []
    @score = 0
  end
  #byebug
  def prayers
    player = @cards.shift
    com = @cards.shift
    #byebug
    @played << [player, com]
    puts "Player: #{player}  Com: #{com}"
    if player > com
      puts "PLayer wins"
      @score += 2
    else
      puts "Player loses"
      @score -= 1
    end
  end
  
  #def score
    
 # end
end

playing = true
play = Game.new
#byebug

while playing
  #byebug
  play.prayers
  puts "current score is: #{play.score}"
  puts "do you want to continue? Press enter"
#

  input = gets.chomp.to_s
  if input == "no"
    puts "Game over"
    playing = false
  end
  
  
  if play.score < -2
    puts "Game Over"
    playing = false
    next
  end
end