require 'byebug'

# create loop for each turn of the game
#check score - whether less than -2 - if not play, if yes, stop game
# keep record of each hand played - think of a way to save the value by player and computer
# inside game method, player draws 2 cards
# Computer draws 2 cards
# higher value gets 1 point
# lower value deduct 1 point
# add or minus score to player
# puts score at every game
# end game when score less than -2


class Card
	attr_accessor :cards
	#deck will create new card game
	def initialize
		@cards = (1..52).to_a
	end
	#deck to shuffle and show card during game
	def show_card
		@cards.shuffle.first
	end
end
# create game class
# create game method in game class
class Game
	def initialize (player1)
		@player1 = player1
		@computer = "computer"
		@deck = Card.new
		@record = []
		@crecord = []
		@score = 0
		@hand = 0
		@chand = 0
		# keep record of each hand played - think of a way to save the value by player and AI	
	end

	def game_play
		if @score <-2
			puts "Gameover"
			self
		end
		while @score >= -2
			# Did show_card twice to draw 2 card. Values are added together to get total score.
			@hand = @deck.show_card + @deck.show_card
			puts @hand
			@record << @hand
			@chand = @deck.show_card + @deck.show_card
			puts @chand
			@crecord << @hand

			if @hand > @chand
				@score +=1
				puts "#{@player1} won! #{@player1} scored #{@score}."
				puts "#{@player1} got #{@hand} while computer had #{@chand}."
				puts "The record is #{@record}."
			else @score -=1
				puts "#{@player1} lost! #{@player1} scored #{@score}."
				puts "#{@player1} got #{@hand} while computer had #{@chand}."
				puts "The record is #{@record}."
				self
			end
		end
	end
end

Sam = Game.new("Sam")
Sam.game_play

byebug