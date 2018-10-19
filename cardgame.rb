require "byebug"

class Cards
attr_accessor :cardsarray
  #1. Create a deck of 1-52
  def initialize
    @cardsarray = []
    52.times do |number|
      @cardsarray << number + 1
    end
  end
end

# deck = Cards.new
# puts deck.deckofcards

# ------------------------------------------------------------------------

class Game
  attr_accessor :deckofcards
  attr_accessor :carddump
  attr_accessor :playerscore
  attr_accessor :playername

  def initialize
    #2. Allow users to shuffle deck of cards then pick out the first card
    @deckofcards = Cards.new.cardsarray.shuffle #to get the deck, we need to create a instance variable, and so we need to do class.key
    @carddump = []
    @playerscore = 0
    @playername
  end

  def playgame
    playerhand = @deckofcards.first
    @deckofcards -= [playerhand]
    househand = @deckofcards.first
    @deckofcards -= [househand]
    @carddump << [playerhand, househand]

    puts "For this round, #{@playername} has this card #{playerhand} while house has this card #{househand}"
    if playerhand < househand
      puts "House wins this round and #{@playername}'s score is #{@playerscore}. Card dump currently contains these cards: #{@carddump}"
      puts "------------------------------------------------------------------------------------------------------------------"
    else
      puts "#{@playername} wins this round and #{@playername}'s score is #{@playerscore}. Card dump currently contains these cards: #{@carddump}"
      puts "------------------------------------------------------------------------------------------------------------------"
    end

    if playerhand < househand
      @playerscore -= 1
    else
      @playerscore += 1
    end
  end

end


# ----------------------------------------------------------------------------

  # attr_accessor :playername

 # def initialize (name)
 #    @playername = name
 #  end

  playing = true
  game = Game.new

  puts "What is your name?"
  playername = gets.chomp
  game.playername = playername


  while playing

    game.playgame

    if game.playerscore < -2
      playing = false
      puts "#{playername}, too bad, you lost. "
    end

  end

# puts game.carddump














































