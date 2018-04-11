require 'byebug'

class Cards
	attr_accessor :cards

	def initialize
		#initialize cards to be an array with 52 elements
		@cards = (1..52).to_a
	end

	#remove the two cards that are picked from the deck
	def removeCards
		@cards.slice!(0,2)
	end
end

class Game
	attr_accessor :score, :turn, :currentDeck, :computerHand, :playerHand

	def initialize
		@computerHand = []
		@playerHand = []
		@score = 0
		@turn = 0
		@currentDeck = []
	end

	def drawCards
		@turn += 1
		puts ""
		puts "Round #{turn}"
		puts("shuffling deck")
		#shuffle deck
		currentDeck.shuffle!
		#draw two cards
		puts("draw two cards from deck")
		@computerHand.push(currentDeck[0])		
		puts "computer has #{@computerHand[turn-1]}"
		@playerHand.push(currentDeck[1])
		puts "player has #{@playerHand[turn-1]}"
	end

	def compare(username)
		puts "Hello " + username + " you have #{score} points"
		bet = 1
		puts "do you want to wager points[Y/N]"
		choice = gets.chomp
		if(choice == "Y")
			puts "how much?"
			bet = gets.chomp
		end

		#if player has highest card, increment score
		if(@playerHand[turn-1] > @computerHand[turn-1])
			@score += bet.to_i.abs
			puts "score added"
		#if computer has highest card, deduct score
		elsif(@playerHand[turn-1] < @computerHand[turn-1])
			@score -= bet.to_i.abs
			puts "score deducted"
		end
		puts "Current score: #{score}"
	end
end

def Gamestart()
	puts "Welcome to ruby-oop-cards"
	puts "What is your name?"
	username = gets.chomp
	puts "Hello #{username}"
	newGame = Game.new
	newCards = Cards.new
	running = true
	while(running)
		#current deck
		newGame.currentDeck = newCards.cards
		#break if there are no cards left in the deck
		break if (newGame.currentDeck == [])	
		#Shuffle current deck
		newGame.drawCards
		#Remove two cards from the deck
		newCards.removeCards
		newGame.compare(username)
		break if (newGame.score < -2)	
		#break if the score is negative 2
		puts "do you want to continue playing [Y/N]"
		answer = gets.chomp
		if answer == "N"
			puts "you folded the game with a score of #{newGame.score}"
			running = false
		end
	end
	puts "Game ended"
end

Gamestart()