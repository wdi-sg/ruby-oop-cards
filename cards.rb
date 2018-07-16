class Cards
	attr_accessor :deck
	def initialize
		@deck = (1..52).to_a
	end
end


class Game
	attr_accessor :player1
	attr_accessor :player2
	attr_accessor :deck


	def initialize
		@deck = Cards.new.deck.shuffle
		@player1 = {current: nil, points: 0, hand: []}
		@player2 = {current: nil, points: 0, hand: []}
	end


	def draw
		if @player1[:current] == nil
			@player1[:current] = @deck.pop
			@player2[:current] = @deck.pop
		else
			@player1[:hand] << @player1[:current]
			@player2[:hand] << @player2[:current]
			@player1[:current] = @deck.pop
			@player2[:current] = @deck.pop
		end

		puts "Player 1 has card #{@player1[:current]}"
		puts "Player 2 has card #{@player2[:current]}"
	end


	def evaluate
		if @player1[:current] > @player2[:current]
			@player1[:points] += 1
			@player2[:points] -= 1
			puts "Player 1 wins"
			puts "Player 1 points: #{@player1[:points]}"
			puts "Player 2 points: #{@player2[:points]}"
			puts
		else
			@player2[:points] += 1
			@player1[:points] -= 1
			puts "Player 2 wins"
			puts "Player 1 points: #{@player1[:points]}"
			puts "Player 2 points: #{@player2[:points]}"
			puts
		end
	end


	def gameplay
		while @player1[:points] > -2 do
			self.draw
			self.evaluate
		end
	end

end
