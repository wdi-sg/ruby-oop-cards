#creates an array of "cards" that are of value 1-52.

class Cards 
	attr_accessor: cards

	def initialize (cards)
		@cards = cards(1..52).to_a
	end

end

class Game
	attr_accessor: cards, computer, player

	def initialize
	    @cards = Cards.new.cards.shuffle #instance variable to create a card Object
	    @computer = {score: 0, cardOnHand: 0, game: []}
	    @player = {score: 0, cardOnHand: 0, game: []}
  	end

  	def play_game
  		if @player[:cardOnHand] > @computer[:cardOnHand]
  			@player[:score] += 1

  			puts "player wins"
  			puts "player score"


end