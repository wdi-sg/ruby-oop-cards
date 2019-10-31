class Cards
    def initialize
      @cards = []
      52.times do |number|
        @cards << number
      end
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
      @score = 0
      @hands = []
    end
  
    def play
      user_hand = @deck.show_card
      house_hand = @deck.show_card

      puts "Player Card is: #{user_hand}"
      puts "Computer Card is: #{house_hand}"    
      
      if house_hand > user_hand
        puts "Sorry bra, you lost..."    
      else
        puts "Noice."
      end   

     @hands << [user_hand, house_hand]
  
      if user_hand > house_hand
        @score += 1
      else
        @score -= 1
      end
    end
  
    def check_game
      @score
    end
  
  end
  


  playing = true

  game = Game.new
  
  while playing
  
    game.play
    puts "current score is: #{game.check_game.to_s}"
  
    puts "do you want to play this hand?"
  
    answer = gets.chomp
    if answer == "q"
        playing = false  
    end
        


    if answer == "no"
      puts "folding"
      next
    end
  
    if game.check_game < -2
      playing = false
    end
  end
  