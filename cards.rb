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
  attr_accessor :score, :deck, :history
  def initialize
    # Get a new deck of shuffled cards
    @deck = Cards.new.cards.shuffle
    @score = 0
    @history = []
    puts @deck.to_s
  end

  def player_draw
    @player_card = deck.pop
  end

  def comp_draw
    @comp_card = deck.pop
  end

  def score_game(player, comp)
    if player > comp
      @score += 1
      puts 'Player Won!!! Adding 1 Point'
    else
      @score -= 1
      puts 'Player Lost. Subtracting 1 Point'
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
  player_card = game.player_draw
  puts "Player drew #{player_card}"

  comp_card = game.comp_draw
  puts "Comp drew #{comp_card}"
# Push a record of each game into the history array
  game.history.push(["Player Card: #{player_card}","Computer Card: #{comp_card}"])
  game.score_game(player_card, comp_card)
  puts "Player Score: #{game.score}"
end
# Show the history when end game
puts "#{game.history}"
