class Card
  @@cards = (1..52).to_a

  def self.pick_card
    @@cards.sample
  end

end

class Game
  @@lose_score = -2

    def initialize(player_name)
        @player_name = player_name
        @player_score = 10
        @computer_score = 10
        @player_cards = []
        @computer_cards = []
    end

    def turn
      current_player_card = Card.pick_card
      current_computer_card = Card.pick_card

      @player_cards << current_player_card
      @computer_cards << current_computer_card

      if current_player_card < current_computer_card
        @player_score -= 5
        @computer_score += 5
      else
        @player_score += 5
        @computer_score -= 5
      end

      puts "Hey #{@player_name}, the current board is: #{@player_score} (you) vs #{@computer_score} (computer)"
    end

    def check_lose(side)
      if side == 'player'
        @player_score <= @@lose_score
      elsif side == 'computer'
        @computer_score <= @@lose_score
      end
    end

    def run
      while true
        turn
        player_lose = check_lose('player')
        computer_lose = check_lose('computer')
        if player_lose
          puts "You lost in #{@player_cards.length} turns"
          puts "Final scores: #{@player_score} (you) vs #{@computer_score} (computer)"
          break
        elsif computer_lose
          puts "You won in #{@player_cards.length} turns"
          puts "Final scores: #{@player_score} (you) vs #{@computer_score} (computer)"
          break
        else
          print "Do you want to continue? Y/n"
          player_answer = gets.chomp
          if player_answer == 'n'
            puts "Final scores: #{@player_score} (you) vs #{@computer_score} (computer)"
            break
          end
        end
      end
    end
end

print "Give me your name: "
player_name = gets.chomp
game = Game.new(player_name)
game.run
