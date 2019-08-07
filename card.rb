class Cards 

	attr_accessor :deck

	def initialize
		numEQV = Array.new(52){|index| index+1} 

		club = Array.new(9) {|index| (index+2).to_s+'c' }
		diamond = Array.new(9) {|index| (index+2).to_s+'d' }
		heart = Array.new(9) {|index| (index+2).to_s+'h' }
		spade = Array.new(9) {|index| (index+2).to_s+'s' }

		@deck = [diamond.concat(['Jd','Qd','Kd','Ad']).concat(club).concat(['Jc','Qc','Kc','Ac']).concat(heart).concat(['Jh','Qh','Kh','Ah']).concat(spade).concat(['Js','Qs','Ks','As']),numEQV]
	end
end

class Game

	attr_accessor :deck
	attr_accessor :chosenByPlayer
	attr_accessor :chosenByComputer
	attr_accessor :player
	attr_accessor :bet

	def initialize (deck, player)
		@deck = deck
		@player = player
		@chosenByPlayer = [[],[]]
		@chosenByComputer = [[],[]]
		@bet = 0
	end

	def playerTurn
		puts "Choose a card from the Deck:"
		chosenNumber = gets.chomp

		if @deck[0].include?(chosenNumber)
			index = @deck[0].find_index(chosenNumber)
			@chosenByPlayer[0].push(@deck[0].delete(chosenNumber))
			@chosenByPlayer[1].push(@deck[1].delete_at(index))
			return true
		else 
			puts
			puts "Either wrong input or card has been chosen!"
			puts
			self.playerTurn
		end
	end 

	def computerTurn
		card = @deck[0][rand(deck[0].length)]
		index = @deck[0].find_index(card)
		@chosenByComputer[0].push(@deck[0].delete(card))
		@chosenByComputer[1].push(@deck[1].delete_at(index))
	end

	#Compare Cards by arr number
	# def compareCards
	# 	if @chosenByComputer.last > @chosenByPlayer.last
	# 		@player[:score]=@player[:score]-@bet 
	# 	else
	# 		@player[:score]=@player[:score]+@bet 
	# 	end
	# end

	def compareCards
		#club<diamond<hearts<spade
		csuit = @chosenByComputer[1].last
		psuit = @chosenByPlayer[1].last

		if csuit > psuit
			@player[:score]=@player[:score]-@bet 
		else
			@player[:score]=@player[:score]+@bet 
		end
	end

	def displayRules
		puts
		puts "************************************* \n* Welcome to the Ruby OOP Card Game * \n*************************************"
		puts


		puts "Rules of the game:"
		puts "1. Choose a card from the deck."
		puts "2, The computer will then choose a card."
		puts "3. If your card is higher than the card the computer choose, you win a point!"
		puts "4. If your card is lower, you lose a point!"
		puts "5. If your score is lower than -2, you lose the game!"
		puts 
	end

	def continue
		puts "Continue with Game? (Y/N)"
		choice = gets.chomp

		if choice.casecmp('y') == 0
			return true
		elsif choice.casecmp('n') == 0 
			return false
		else
			puts
			puts "Invalid Choice"
			puts
			self.continue
		end
	end

	def getBet
		puts "How many points will you bet this round?"
		points = gets.chomp

		check = points.to_i
		if check.to_s == points
			@bet = check
		else
			puts
			puts "Invalid Bet"
			puts
			self.getBet
		end
	end

end

system("cls") || system("clear")

puts
puts "************************************* \n* Welcome to the Ruby OOP Card Game * \n*************************************"
puts


puts "Rules of the game:"
puts "1. Choose a card from the deck."
puts "2. If your card is higher than the card the computer choose, you win a point!"
puts "3. If your card is lower, you lose a point!"
puts "4. If your score is lower than -2, you lose the game!"
puts 

puts "First, what is your name?"
playerName = gets.chomp

cardDeck = Cards.new
newGame = Game.new(cardDeck.deck, {:name =>playerName, :score=>0})

while (newGame.deck[0].length>0 && newGame.player[:score]>=-2)

		system("cls") || system("clear")

		puts
		puts "************************************* \n* Welcome to the Ruby OOP Card Game * \n*************************************"
		puts


		puts "Rules of the game:"
		puts "1. Choose a card from the deck."
		puts "2. If your card is higher than the card the computer choose, you win a point!"
		puts "3. If your card is lower, you lose a point!"
		puts "4. If your score is lower than -2, you lose the game!"
		puts

		puts "---------------------------------------------------------------"
		puts "|Current Cards Left in Deck: #{newGame.deck[0]}"
		puts
		puts "#{newGame.player[:name]}'s Choices: #{newGame.chosenByPlayer[0]}"
		puts "Computer's Choices: #{newGame.chosenByComputer[0]}"
		puts
		puts "#{newGame.player[:name]}'s Score: #{newGame.player[:score]}"
		puts "---------------------------------------------------------------"
		puts

	if newGame.continue
		
		puts 
		newGame.getBet
		newGame.computerTurn
		puts 
		newGame.playerTurn
		newGame.compareCards
		
	else
		break
	end 
end

system("cls") || system("clear")

puts
puts "************************************* \n* Welcome to the Ruby OOP Card Game * \n*************************************"
puts


puts "Rules of the game:"
puts "1. Choose a card from the deck."
puts "2. If your card is higher than the card the computer choose, you win a point!"
puts "3. If your card is lower, you lose a point!"
puts "4. If your score is lower than -2, you lose the game!"
puts

puts "---------------------------------------------------------------"
puts "|Current Cards Left in Deck: #{newGame.deck}"
puts
puts "#{newGame.player[:name]}'s Choices: #{newGame.chosenByPlayer[0]}"
puts "Computer's Choices: #{newGame.chosenByComputer[0]}"
puts
puts "#{newGame.player[:name]}'s Score: #{newGame.player[:score]}"
puts "---------------------------------------------------------------"

if (newGame.deck.length>0 && newGame.player[:score]>=-2)

	puts
	puts "You have stopped the game! Booo~!"
	puts

elsif newGame.player[:score]>=-2
	puts
	puts "You have won the game!"
	puts
else 
	puts
	puts "You have lost the game!"
	puts
end
