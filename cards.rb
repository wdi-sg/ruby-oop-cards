class Card

  def initialize
    @cards = Array(1..52)
    p "deck of cards created"
  end

  def showcards
    @cards.each do |x|
      puts x
    end
  end

  def takeone
    position = rand()*@cards.length
    givencard = @cards[position]
    @cards.delete_at(position)
    return givencard
  end

end

class Game

  def initialize(deck)
    @deck = deck
    @historyarray = Array.new
  end

  def showallcards
    @deck.showcards
  end

  def drawtwocards
    set = {
      player: @deck.takeone,
      computer: @deck.takeone
    }
    return set
  end

  def compareresult
    result = drawtwocards()
    gamehistory(result)
    if result[:player] > result[:computer]
      p "player won with #{result[:player]}, computer lost with #{result[:computer]}"
      return "win"
    else
      p "computer won with #{result[:computer]}, player lost with #{result[:player]}"
      return "lose"
    end
  end

  def gamehistory(result)
    @historyarray.push(result)
  end

  def showhistory
    return @historyarray
  end

end

cardset = Card.new
game = Game.new(cardset)


playerscore = 0
gamestatus = true
puts "Please enter your name"
name = gets.chomp
puts "Welcome #{name}, to play, type 'play', to leave the game, type 'quit'"

while (gamestatus)
  if (playerscore <= -2)
    puts "Game Over!"
    game.showhistory.each do |x|
      puts x[:player]
    end
    break
  end
  play = gets.chomp
  if (play == "play")
    if (playerscore <= 0)
      puts "You can bet only 1 point for this round"
      bet = 1
    else
      awaitinginput = true
      while (awaitinginput)
        puts "How much would you like to bet? You can bet up to #{playerscore} for this round"
        bet = gets.chomp
        if bet.to_i <= playerscore
          awaitinginput = false
        end
      end
    end
    result = game.compareresult
    if (result == "win")
      playerscore += bet.to_i
      puts "#{name}, your current score is #{playerscore}"
    elsif (result == "lose")
      playerscore -= bet.to_i
      puts "#{name}, your current score is #{playerscore}"
    end
  elsif (play == "quit")
    puts "Game Over!"
    puts "#{name}, your final score is #{playerscore}"
    break
  end
end
