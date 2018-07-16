require('./cards.rb')

class Game

	attr_accessor :cards, :records, :score

	def initialize

		@cards = Card.new
		@records = []
		@score = 0
		@finish = false

	end

	def score_check

		puts "\nYour current score is #{@score}!"

	end

	def play

		if @score > -2 && cards.draw != "NO MORE CARDS"

			player = @cards.draw
			puts "\nPlayer has drawn #{player}."
			banker = @cards.draw
			puts "Banker has drawn #{banker}."

			if player > banker
				@score += 1
				puts "\nPlayer has won this round!"
			else
				@score -= 1
				puts "\nBanker has won this round!"
			end

			@records.push([player, banker])

			score_check

		else

			puts "\nSorry you have lost!"

		end

		puts "\nCurrent Records: #{@records}."

	end

	def end_game

		@finish = true
		puts "\nThank you for playing the game! Your end score is #{@score}!"
		puts "~~~~~~~~~~~~~~~~~~END OF GAME~~~~~~~~~~~~~~~~~~"

	end

	def start

		while @score > -2 && @cards.draw != "NO MORE CARDS" && @finish == false

			playing = ""

			if @records.length == 0

				loop do
					puts "\nWill you like to start the game? (Y/N)"
					playing = gets.chomp
					break if playing.upcase == "Y" || playing.upcase == "N"
				end

			else

				loop do
					puts "\nDo you want to continue playing? (Y/N)"
					playing = gets.chomp
					break if playing.upcase == "Y" || playing.upcase == "N"
				end

			end

			if playing.upcase == "Y"
				
				play

			else

				@finish = true

			end

		end

		end_game

	end

end

game = Game.new

game.start