require 'byebug'

class Card
	attr_reader :rank, :suit, :suit_text

	def initialize (rank, suit)
		@rank = rank
		@suit = suit
		
		case suit
		when 1
			@suit_text = 'Diamonds'
		when 2
			@suit_text = 'Clubs'
		when 3
			@suit_text = 'Hearts'
		when 4
			@suit_text = 'Spades'
		end
	end
end

class Deck
	attr_reader :cards

	def initialize
		@cards = []
		13.times do |rank|
			4.times do |suit|
				cards << Card.new(rank + 1, suit + 1)
			end
		end
		cards.shuffle!
	end

	# do I need this
	def shuffle
		cards.shuffle!
		self
	end

	def draw
		cards.pop
	end
end

class Game
	attr_reader :points

	def initialize
		@deck = Deck.new
		@points = 0
	end

	def play	
		puts "Let's play a game! What is your name?"
		
		name = gets.chomp
		repeat = true
		
		bet = 0

		while bet == 0
			puts "Ok. Let's see who draws the higher card. How many points do you want to bet per round?"
			bet = gets.chomp.to_i
		end

		while repeat == true
			player_hand = @deck.draw
			dealer_hand = @deck.draw
			
			puts "You drew a #{player_hand.rank} of #{player_hand.suit_text}. The dealer drew a #{dealer_hand.rank} of #{dealer_hand.suit_text}."
			puts "#{@deck.cards.length} cards left in deck."
		
			if player_hand.rank > dealer_hand.rank
				@points += bet
				puts 'You won this hand.'
			elsif player_hand.rank < dealer_hand.rank
				@points -= bet
				puts 'You lost this hand.'
			elsif player_hand.rank == dealer_hand.rank
				puts 'This hand was a draw.'
			end

			# if @points < -2
			# 	puts "You lost. Better luck next time!"
			# 	return
			# end
		
			choice = ''
		
			while choice != 'y' && choice != 'n'
				puts "#{name}, your score is #{points}. Play again? (y/n)"
				choice = gets.chomp
			end
		
			if choice == 'n'
				puts 'Ok, thanks for playing!'
				repeat = false
			else 
				puts "Ok, let's play again."
			end
		end
	end
end

test = Game.new
test.play

