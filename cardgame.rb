class Cards
    def initialize
      @cards = []
      52.times do |number|
        @cards << number
      end
    end

    def gameplay
        user_hand = @deck.show_card
        house_hand = @deck.show_card
    
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