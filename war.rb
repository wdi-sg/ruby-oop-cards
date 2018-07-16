class Cards
    def initialize
      #splat a range  
      @cards = [*1..52]
      
    end
    
    #method that shuffles the array and returns the first element. alternatively use .last
    def card_drawn
      @cards.shuffle.first
    end
end

class War
  attr_accessor :name, :player_hands, :ai_hands
    
    def initialize
      #creates new set of cards array
      @shuffled = Cards.new
      #player score initially 0
      @player_score = 0
      #empty array to keep a record of each hand played
      @player_hands = []
      @ai_hands =[]
    end
  
    def get_name name
      @name = name
    end
  
    def play
      # shuffles array and draws first index
      player = @shuffled.card_drawn
      ai = @shuffled.card_drawn
      
      #pushed in respective arrays, to keep track?
      @player_hands.push(player)
      @ai_hands.push(ai)
      
      #compare to add/deduct score
      if player > ai
        @player_score += 1
      elsif player == ai
        @player_score += 0
      else
        @player_score -= 1
      end
    end
  
    def check_score
      @player_score
    end
  
  end

####### game play ###########
  
not_playing = false

war = War.new

until not_playing

  #start game
  war.play

  #get username
  if war.name == nil
    puts "what is your name?"
    name = gets.chomp
    war.get_name(name)
  end

  puts "WAR! you drew #{war.player_hands.last}, while AI drew #{war.ai_hands.last}"
  puts "#{war.name}, your score is: #{war.check_score}"

  puts "do you want to play the next hand?"
  answer = gets.chomp
  if answer == "no"
    puts "aww ur scared!"
    puts "#{war.name}, your final score is: #{war.check_score}"
    not_playing = true
  end

  if war.check_score < -2
    not_playing = true
  end

end