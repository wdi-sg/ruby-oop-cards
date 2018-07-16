class Card

	attr_accessor :cards

	def initialize

		@cards = []
		1.upto(52) do |i|
			@cards.push(i)
		end

	end

	def draw

		if @cards.length > 0
			@cards.slice!(rand(@cards.length))
		else
			puts "Sorry there are no cards left..."
			"NO MORE CARDS"
		end

	end

end