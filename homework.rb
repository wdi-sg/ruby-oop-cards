class Cards

	def initialize
		@deck = (1..52).to_a # make range, convert to array
	end

	def hit_me
		@deck.shuffle!.pop # ! prevents returning a new array. pop takes away last element and returns it
	end

	def deck_empty
		@deck.empty? # returns true if empty
	end

end


class Game

	def initialize
		@deck = Cards.new
		@score = 0
		@hands_played = []
		puts "Enter your name"
		@name = gets.chomp
	end

	def play_round # draw 2 cards, adjust score, print result
		player_card = @deck.hit_me
		computer_card = @deck.hit_me

		player_bet = 1
		if @score > 0
			puts "#{@name}, your score is now #{@score}."
			puts "Wager your score? Enter number of points to bet."
			player_bet = gets.to_i
			while player_bet > @score
				puts "You don't have enough points. Try again."
				player_bet = gets.to_i
			end
		end		

		@hands_played.push << player_card
		@hands_played.push << computer_card
		# puts @hands_played

		if player_card > computer_card
			@score += player_bet
		else
			@score -= player_bet
		end
		puts "You drew #{player_card} and Computer drew #{computer_card}. #{@name}, your score is now #{@score}"
	end

	def play_game # keep going until cards are out or game is over.
		while @deck.deck_empty == false && @score >= -2
			play_round
			puts "Play again? Y/N"
			play_again = gets.chomp.downcase
			if play_again == 'n'
				break
			end
		end
	end
end	


game = Game.new
game.play_game

