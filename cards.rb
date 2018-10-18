# Create Cards Class
class Cards
  attr_accessor :cards
  def initialize
    @cards = []
    52.times do |num|
      @cards << num
    end
  end

  def draw_card
    @cards.pop
  end
end
# Create Game Class
class Game
  attr_reader :player_name
  attr_accessor :score, :deck, :history, :wager
  def initialize
    # Get a new deck of shuffled cards
    @deck = Cards.new.cards.shuffle
    @score = 2
    @history = []
    puts "What is your name?"
    @player_name=gets.chomp
  end

  def player_draw
    @player_card = deck.pop
  end

  def comp_draw
    @comp_card = deck.pop
  end

  def score_game(player, comp)
    if player > comp
      @score += @wager
      puts 'Player Won!!! Adding 1 Point'
    else
      @score -= @wager
      puts 'Player Lost. Subtracting 1 Point'
    end
  end

  def wager
    puts "How many points do you want to wager?"
    @wager = gets.chomp.to_i
    if @wager <= score
      @wager = @wager
    else
      puts "That is not allowed. We will show hand for u"
# I wanted to loop back to the top of the function to get the user to input the score again, but not sure how to do that.
      @wager = score
    end
  end
end

game = Game.new

while game.score > -2
  if game.deck.empty?
    puts 'NO CARDS LEFT!!!!'
    # Adding the break statement here will break the loop immediately when there are no more cards.
    # Otherwise there would be 2 extra Player drew Comp drew statements with nil values and code will break
    break
  end
    game.wager
  player_card = game.player_draw
  puts "#{game.player_name} drew #{player_card}"

  comp_card = game.comp_draw
  puts "Comp drew #{comp_card}"
# Push a record of each game into the history array
  game.history.push(["Player Card: #{player_card}","Computer Card: #{comp_card}"])
  game.score_game(player_card, comp_card)
  puts "Hello #{game.player_name}, you have #{game.score} points"
  puts "Do you want to continue with this game?"
  answer = gets.chomp
  # Rather than doing a yes/no, only end the game if player answers no
  break if answer == "no"
end
# Show the history when end game
puts "#{game.history}"
