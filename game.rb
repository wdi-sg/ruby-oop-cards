class Cards
   def initialize
      @cards = (1..52).map { |item| item }
      puts @cards
   end  

   def draw_card
      @cards.shuffle.first
   end
end

class Game

   def initialize
      @deck = Cards.new
      @player1_score = 0
      @player2_score = 0
      @hands = []
   end

   def play 
      player1_hand = @deck.draw_card
      player2_hand = @deck.draw_card

      if player1_hand > player2_hand 
         @player1_score += 1
         @player2_score -= 1

      elsif player2_hand > player1_hand
         @player2_score += 1
         @player1_score -= 1
      else 
         @player1_score = @player1_score
         @player2_score = @player2_score
      end

      def check_score
         @player1_score
         @player2_score

         if player1_score < -2 || player2_score < -2
            

      end
   end

end
