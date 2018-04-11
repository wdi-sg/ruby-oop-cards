class Cards

      def initialize (number_of_cards)
            @card_total = number_of_cards
            @cards = (0..number_of_cards - 1).to_a.shuffle
      end

      def cards
            @cards
      end

      def cards_length
            @cards.length
      end

      def draw_card
            card_drawn = @cards.shift
      end

      def text(card_number)
            card_strength = card_number / 4 + 2
            if card_strength == 11
                  card_strength = "Jack"
            elsif card_strength == 12
                  card_strength = "Queen"
            elsif card_strength == 13
                  card_strength = "King"
            elsif card_strength == 14
                  card_strength = "Ace"
            end
            
            card_suit = card_number % 4
            if card_suit == 0
                  card_suit = " of Clubs"
            elsif card_suit == 1
                  card_suit = " of Diamonds"
            elsif card_suit == 2
                  card_suit = " of Hearts"
            elsif card_suit == 3
                  card_suit = " of Spades"
            end

            card_strength.to_s + card_suit
      end

      def blackjack_score (card_number)
            card_strength = card_number / 4 + 2

            if card_strength == 11
                  card_strength = 11
            elsif card_strength > 10
                  card_strength = 10
            end
            card_strength.to_i
      end
end

class Game

      def initialize (deck_number)
            @deck_number = deck_number
            @player_points = 0
            @hands_played = []
            @player_name = ""
            @current_bet = 0
      end

      def player_wins_double
            @player_points += @current_bet * 2
      end

      def player_wins
            @player_points += @current_bet
      end

      def player_loses
            @player_points -= @current_bet
      end

      def player_score
            @player_points
      end

      def start_game
            puts "How many points would you like to wager? Enter 0 to end game"
            @current_bet = gets.chomp.to_i
            if @deck_number.cards_length > 1  && @player_points > -2 && @current_bet > 0
                  play_card
                  puts "Hello #{@player_name}, you have " + @player_points.to_s + " point(s)"
                  start_game
            elsif @deck_number.cards_length > 1  && @current_bet.to_i > 0
                  puts "Sorry! You do not have enough points to continue!"
                  puts "Final score: " + @player_points.to_s
                  puts "Hands played: " + @hands_played.to_s
            else
                  puts "Final score: " + @player_points.to_s
                  puts "Hands played: " + @hands_played.to_s
            end
      end

      def play_card 
            player_card = @deck_number.draw_card
            @hands_played << @deck_number.text(player_card)
            player_card2 = @deck_number.draw_card
            @hands_played << @deck_number.text(player_card2)
            
            computer_card = @deck_number.draw_card
            computer_card2 = @deck_number.draw_card
            puts "Player draws: " + @deck_number.text(player_card) + " and " + @deck_number.text(player_card2)
            puts "Dealer draws: " + @deck_number.text(computer_card) + " and " + @deck_number.text(computer_card2)

            player_score = @deck_number.blackjack_score(player_card) + @deck_number.blackjack_score(player_card2)
            dealer_score = @deck_number.blackjack_score(computer_card) + @deck_number.blackjack_score(computer_card2)

            if player_score == 21
                  puts "PLAYER HITS BLACKJACK!!!!!!!!"
                  player_wins_double
            elsif player_score > 21
                  puts "Player BUST!"
                  player_loses
            elsif dealer_score > 21
                  puts "Dealer BUST!"
                  player_wins
            elsif player_score > dealer_score
                  puts "Player Wins!"
                  player_wins
            elsif player_score < dealer_score
                  puts "Player Loses!"
                  player_loses
            elsif player_score == dealer_score
                  puts "Dealer takes the pot!"
                  player_loses
            end
      end

      def init_game
            puts "Enter your name: "
            @player_name = gets.chomp
            start_game
      end

end





deck1 = Cards.new(52)
game1 = Game.new(deck1)
game1.init_game
