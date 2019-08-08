class Cards
  def initialize
    @cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52]
  end

  def show_card
    @cards.shuffle.first
  end

  def get_card
    @cards.shuffle.pop
  end
end

card = Cards.new.show_card

puts card

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
      @score += 1
    else
      @score -= 1
    end
  end

  def check_game
    @score
  end
end

puts "Start game? (yes/no)"
ans = gets.chomp
if ans == "yes"
  game_state = true
  game = Game.new
  while game_state

    game.play
    puts "current score is: #{game.check_game.to_s}"

    puts "Go you want to play this hand?"

    answer = gets.chomp
    if answer == "no"
      puts "folding"
      next
    end

    if game.check_game < -2
      game_state = false
      return
    end
  end
else
  puts "No game to play"
end