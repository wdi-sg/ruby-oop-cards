require 'byebug'

class Cards
	attr_reader :cards

	def initialize
		@cards = []
		52.times do |number|
			@cards << number
		end
	end
end

generate_cards= Cards.new

class Game
	attr_reader :drawn_cards, :house_card, :player_card, :player_score, :deck, :play_again

	def initialize()
		@deck=Cards.new.cards
		@player_score=0
	end

	def play
		@drawn_cards = @deck.sample(2)
		@house_card=drawn_cards[0]
		@player_card=drawn_cards[1]
		self
	end

	def checkWin
		if @player_card > @house_card
			@player_score +=1
			puts @player_score
		else 
			@player_score -=1
			puts "lost"
			puts @player_score
		end
		puts "want to play again?"
		@play_again=gets.chomp
		if (@play_again=="y")
			play
		else 
			puts "there"
			until (@play_again=="y")||(@play_again=="n")
				puts "invalid input,enter again"
				@play_again=gets.chomp	
			end
		end
		self
	end

end

is_game_on = true
game = Game.new
while is_game_on
	game.play.checkWin
	if game.player_score < -2
		puts "Game Over"
		is_game_on=false
	end
	if game.play_again=="n"
		puts "Game Over"
		is_game_on=false
	end

end

byebug
puts "test"
