class Cards

	attr_accessor :cards

	def initialize
		@cards = []
		for num in (1..52)
		  @cards << num
		end
	end

	def draw_card
		puts "cards length",@cards.length
		@cards.shuffle!.pop
	end
end

class Game

	attr_accessor :hands, :score, :player_hand, :dealer_hand, :cards

	def initialize(cards)
		@hands = []
		@score = 0
		@player_hand = []
		@dealer_hand = []
		@cards = cards
	end

	def play
		2.times {@player_hand << @cards.draw_card}
		puts "Player drew #{@player_hand}"
		print "\n"
		2.times {@dealer_hand << @cards.draw_card}
		puts "Dealer drew #{@dealer_hand}"

		@hands << [@player_hand, @dealer_hand]
	end
end


playing = true
cards = Cards.new
game = Game.new(cards)

while playing
	
	if cards.cards.length < 1
		cards = Cards.new
		game = Game.new(cards)
	end

	game.play

	puts "current score is: #{game.score.to_s}"
  	puts "do you want to play this hand?"

  	answer = gets.chomp
  	if answer == "no"
	    puts "folding"
	    next
	else
		print "player hand #{game.player_hand}"
	  	if game.player_hand.max > game.dealer_hand.max
			game.score += 1
		else
			game.score -= 1
		end
		game.player_hand.clear
		game.dealer_hand.clear
		if game.score < -2
			playing = false
			puts "GAME OVER!!"
			return
		end
	end
end