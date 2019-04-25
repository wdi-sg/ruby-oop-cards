class  Cards
  def initialize
    @cards = []
    52.times do |number|
      @cards << number
  end
end

  def show_card
    @cards.shuffle.first
    puts show_card
  end

  def get_card
    @cards.shuffle.pop
    puts get_card
  end
end

class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []
  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card

    @hands << [user_hand, house_hand]

    if user_hand > house_hand
      @score +=1
    else
      @score -=1
    end
  end

  puts user_hand
  puts house_hand

  def check_game
    @score
  end

end

playing = true
game = Game.new

while playing

  game.play
  puts "current score is: #{game.check_game.to_s}"

  puts "do you want to continue playing?"

  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  end

  if game.check_game <-2
    playing = false
  end
end