class Cards
	attr_accessor :cards

	def initialize
		#initialize cards to be an array with 52 elements
		@cards = (1..52).to_a
	end

	#remove the two cards that are picked from the deck
	def remove_cards
		@cards.slice!(0,2)
	end
end

class Game
	attr_accessor :score, :turn, :current_deck, :computer_hand, :player_hand

	def initialize
		@computer_hand = []
		@player_hand = []
		@score = 0
		@turn = 0
		@current_deck = []
	end

	def drawCards
		@turn += 1
		puts ""
		puts "Round #{turn}"
		puts("shuffling deck")
		#shuffle deck
		current_deck.shuffle!
		#draw two cards
		puts("draw two cards from deck")
		@computer_hand.push(current_deck[0])		
		puts "computer has #{@computer_hand[turn - 1]}"
		@player_hand.push(current_deck[1])
		puts "player has #{@player_hand[turn - 1]}"
	end

	def compare(username)
		puts username + ", you have scored #{score} points"
		bet = 1
		puts "would you like to place a bet? [y/n]"
		choice = gets.chomp
		if(choice == "y")
			puts "how much?"
			bet = gets.chomp
		end

		#if player has highest card, increment score
		if(@player_hand[turn - 1] > @computer_hand[turn - 1])
			@score += bet.to_i.abs
			puts "score added"
		#if computer has highest card, deduct score
		elsif(@player_hand[turn - 1] < @computer_hand[turn - 1])
			@score -= bet.to_i.abs
			puts "score deducted"
		end
		puts "Current score: #{score}"
	end
end

def Gamestart()
	puts "Please Enter Your Name"
	username = gets.chomp
	puts "Welcome, #{username}!"
	new_game = Game.new
	new_cards = Cards.new
	running = true
	while(running)
		#current deck
		new_game.current_deck = new_cards.cards
		#break if there are no cards left in the deck
		break if (new_game.current_deck == [])	
		#Shuffle current deck
		new_game.drawCards
		#Remove two cards from the deck
		new_cards.remove_cards
		new_game.compare(username)
		break if (new_game.score < -2)	
		#break if the score is negative 2
		puts "Continue playing [y/n]"
		answer = gets.chomp
		if answer == "n"
			puts "You have Lost! your score was #{new_game.score}"
			running = false
		end
	end
	puts "DONZIES!"
end

Gamestart()