class Game

  attr_accessor :deck
  attr_accessor :score
  attr_accessor :played
  attr_accessor :myCard

  def initialize
    @deck = Deck.new
    @score = 0
    @played = []
    @myCard = nil
  end

  def drawMyCard
    @myCard = @deck.getCard
    puts "\nMy card: " + myCard.to_s
  end

  def start(bet)
    houseCard = @deck.getCard
    @played.push([@myCard,houseCard])
    puts "House card: " + houseCard.to_s + "\n"
    bet = bet.to_i
    if myCard > houseCard
      @score += bet
    else
      @score -= bet
    end
  end

  def check
    @score
  end
end



# if ARGV[0] == "start"
#   game = Game.new
#   game.start
#   if ARGV[1]
#     n = ARGV[1].to_i - 1
#     n.times do
#      game.start
#     end

#     if ARGV[2] === "score"
#       puts "My score is: " + game.check.to_s
#     end
#   end
# end