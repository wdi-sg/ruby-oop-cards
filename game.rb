#Ruby OOP Card game
require 'byebug'

#game

class Game
	attr_reader :player_name, :score, :pc_hand, :hand, :deck
 	attr_writer :player_name, :score, :pc_hand, :hand, :deck, :turn

 	def initialize(name)
 		@player_name = name
 		@score = 0
 		@pc_hand = []
 		@hand = []
 		@turn = true
 		@deck = Deck.new
 	end

 	def draw
 		if @turn == true
 			self.deck.deck.shuffle!
 			@pc_hand << self.deck.deck[0]
 			puts "The house draws " + pc_hand[pc_hand.length-1].to_s
 			self.deck.deck.shift
 			@turn = !@turn
 		else
 			self.deck.deck.shuffle!
 			@hand << self.deck.deck[0]
 			puts "You draw " + hand[hand.length-1].to_s
 			self.deck.deck.shift
 			@turn = !@turn
 		end
 	end

 	def compare_hands
 		self.hand[self.hand.length-1] - self.pc_hand[pc_hand.length-1]
 	end
end

class Deck
	attr_reader :deck
 	attr_writer :deck

 	def initialize
 		@deck = []
 		x = 1
 		until x == 53
 			@deck << x
 			x += 1
 		end
 	end
end

$bet = 1 #Default
$first_run = true

while true
	
	puts "Welcome to QuickDraw!"
	if $first_run
		puts "What is your name?"
		play = Game.new(gets.chomp)
		$first_run = false
		puts "Hello #{play.player_name}"
	end

	play.draw

	puts "Would you like to draw? (Y/N)"
	
	if gets.chomp.downcase == "y"
		play.draw

		if play.compare_hands > 0
			play.score += $bet
			puts "You win"
		else
			play.score -= $bet
			puts "You lost"
		end
	else
		puts "Wuss! Next round..."
		play.turn = true
	end
	
	puts "Hey #{play.player_name}, your score is #{play.score}, the current bet is #{$bet}."
	puts "How points do you want to wager?"
	$bet = gets.chomp.to_i

	if $bet < 1
		puts "Minimum bet is 1"
		$bet = 1
	end

	if play.score < -2
		puts "You've gone the deep end... Bye..."
		break
	end
	puts "Would you like to play again? (Y/N)"

	if gets.chomp.downcase != "y"
		break
	end
end