class Cards
   def initialize
      @cards = (1..52).map { |item| item }
      puts @cards
   end  

   def draw_card
      @cards.shuffle.pop
   end
end

class Game

   def initialize
      @deck = Cards.new
      @player_score = 0
      @hands = []
   end

   def the_game
      player_hand = @deck.draw_card
      ai_hand = @deck.draw_card
      @hands << player_hand
      @hands << ai_hand

      if player_hand > ai_hand 
         @player_score += 1
         puts "Player's hand: #{player_hand}, is higher than AI. Score added: #{@player_score}"
      else
         @player_score -= 1
         puts "Player's hand: #{player_hand}, is lower than AI. Minus-ed score : #{@player_score}"
      end
   end

   def play_game
      while @player_score > -2
         the_game
      end
   end

end

cardgame = Game.new
cardgame.play_game
