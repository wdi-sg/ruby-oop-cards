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
  	# Initialize game
	def initialize(name)
		@score = 0
		@player_name = name
		@deck = Deck.new
	  	@playing = true
	  	@wager = 0
	end

	# Get overall score
	def score
		@score
	end

	# Play a round
	def play_turn
		player_card = @deck.get_card
		computer_card = @deck.get_card
		p @player_name+ " drew card "+player_card.to_s
		p "Computer drew card "+computer_card.to_s

		if player_card < computer_card
			p "Your card is lower!"
			if @wager == 0
			  @score-=1
			else
			  @score-=@wager
			end
		else
			p "Your card is higher!"
			if @wager == 0
				@score+=1
			else
			  	@score+=@wager
			end
		end
		p "Hey #{@player_name}, you have #{@score} points."
	end

	# Set wager
	def set_wager(wager)
	  	if @wager > @score and @wager > 1
		  p "You do not have enough points. Please enter another amount."
		  set_wager(gets.chomp)
		else
			@wager = wager.to_i
		end
	end

	# Check if game end if score is less than 2, or deck run out, or player refused to continue
	def check_turn
		@score > -2 and @deck.get_deck_count > 0 and @playing
	end

	# End game message
  	def end_game
	  p "Gamer ended!~~~~~~~~~~~"
	  p "Your final score is #{@score.to_s} points"
	end

	# Check if continue
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

# Prompt user for name
p "What is your name?"
current_game = Game.new(gets.chomp)

# Start the game loop
while (true)
	current_game.play_turn
	if (current_game.check_turn)
		p "Continue? (y/n)"
		if current_game.continue_game(gets.chomp) == false
		  	break
		end
		if (current_game.score <=1)
		  current_game.set_wager(0)
		else
		  p "You may make a wager with some of your points. Default will be 1."
		  p "Current points: #{current_game.score}. How much is your bet?"
		  current_game.set_wager(gets.chomp)
	  	end
	else
	  break
	end
end

# If game loop stop, show end game
current_game.end_game
