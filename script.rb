class Cards
	def initialize
		@cards = []
		for num in (1..52)
		  @cards << num
		end
	end

	def draw_card
		@cards.shuffle.pop
	end
end

class Game
	def initialize
		@hands = []
		@score = 0
		@player_hand = []
		@dealer_hand = []
		@deal = cards
	end

	def play
		2.times {@player_hand << deal.draw_card}
		puts @player_hand
		2.times {@dealer_hand << deal.draw_card}
		puts @dealer_hand

		@hands << [player_hand, dealer_hand]
		puts @hands

		if player_hand.max > dealer_hand.max
			@score += 1
		else
			@score -= 1
		end
	end

	def check_game
		@score
	end

	def deal
		@deal
	end
end


playing = true

cards = Cards.new
print cards,"\n"
game = Game.new
print game,"\n"

while playing
	game.play

	puts "current score is: #{game.check_game.to_s}"
  	puts "do you want to play this hand?"

  	answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  end

  if game.check_game < -2
    playing = false
    return
  end
end