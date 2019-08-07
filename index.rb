class Deck
	def initialize
		@cards = [*1..52]
	end

	def get_deck_count
		@cards.length
	end

	def get_card
		@cards = @cards.shuffle
		@cards.pop
	end
end

class Game
	def initialize(name)
		@score = 0
		@player_name = name
		@deck = Deck.new
	  	@playing = true
	end

	def get_score
		@score
	end

	def play_turn
		player_card = @deck.get_card
		computer_card = @deck.get_card
		p @player_name+ " drew card "+player_card.to_s
		p "Computer drew card "+computer_card.to_s

		if player_card < computer_card
			p "Your card is lower!"
			@score-=1
		else
			p "Your card is higher!"
			@score+=1
		end
		p "Current score: #{get_score} points."
	end

	def check_turn
		@score > -2 and @deck.get_deck_count > 0 and @playing
	end

  	def end_game
	  p "Gamer ended!~~~~~~~~~~~"
	  p "Your final score is #{@score.to_s} points"
	end

  	def continue_game(response)
	  	if response == "y"
		  	true
	  	elsif response == "n"
			false
	  	elsif response !="y"
			p "Please enter a valid response"
			p "Continue? (y/n)"
		  	continue_game(gets.chomp)
	  	end
	end
end

p "What is your name?"
current_game = Game.new(gets.chomp)

while (true)
	current_game.play_turn
	if (current_game.check_turn)
		p "Continue? (y/n)"
		if current_game.continue_game(gets.chomp) == false
		  	break
		end
	else
	  break
	end
end

current_game.end_game