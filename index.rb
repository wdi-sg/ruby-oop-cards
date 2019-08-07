class Card
  	def initialize(rank, suit, value)
	  	@rank = rank
	  	@suit = suit
		@value = value
	end

	def rank
		@rank
	end

	def suit
		@suit
	end

	def value
		@value
	end
end
class Deck
	def initialize
	  	@cards = 	[]
	  	@ranks = ['A', *(2..10), 'J', 'Q', 'K']
	  	@suits = ['♦','♣', '♥', '♠']
	  	@ranks.each_with_index do |rank,index_1|
		  	@suits.each_with_index do |suit, index_2|
			  	@cards.push(Card.new(rank,suit,(index_1*4)+index_2))
			end
		end
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
		@game_summary = [];
	end

	# Get overall score
	def score
		@score
	end

	# Play a round
	def play_turn
		player_card = @deck.get_card
		computer_card = @deck.get_card
		compare(player_card,computer_card)
		p "Hey #{@player_name}, you have #{@score} points."
	end

	# Compare cards
	def compare(player,computer)
		p "You drew #{player.rank} #{player.suit}. Computer drew #{computer.rank} #{computer.suit}"
		if player.value < computer.value
		  	p "Your card is lower!"
			result = 'loss'
		  	if @wager == 0
				@score-=1
		 	else
				@score-=@wager
		  	end
		else
		  	p "Your card is higher!"
			result = 'win'
		  	if @wager == 0
				@score+=1
		  	else
				@score+=@wager
		  	end
		end
		@game_summary.push([player,computer,result])

	end
	# Set wager
	def set_wager(wager)
		@wager = wager.to_i
	  	if @wager > @score and @wager > 1
		  	p "You do not have enough points. Please enter another amount."
		  	set_wager(gets.chomp)
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
		p "Do you want to see the summary of the game? (y/n)"
		show_summary(gets.chomp)
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

	def show_summary(response)
		if (response == "y")
			total_wins = 0;
			p "-".ljust(36,"–")
			p "| Round | You vs Computer | Result |"
			@game_summary.each.each_with_index do |record,index|
				if (record[2] == "win")
					total_wins+=1
				end
				p "| #{index+1}".ljust(6)+"|  #{record[0].rank} #{record[0].suit} vs #{record[1].rank} #{record[1].suit}".center(19)+" | #{record[2]}".ljust(9)+" |"
			end
			p "-".ljust(36,"–")
			p "Total wins: #{total_wins}/#{@game_summary.length}"
		elsif (response == "n")
			p "Hope you had fun! Goodbye!"
		else
			p "Please enter a valid response"
			show_summary(gets.chomp)
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
