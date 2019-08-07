class Deck
  def initialize
    @cards = [*1..52]
  end

  def get_deck_count
    @cards.length
  end

  def get_card
    @cards = @cards.shuffle
    @cards.pop
  end
end

class Game
  def initialize(name)
    @score = 0
    @player_name = name
    @deck = Deck.new
  end

  def get_player_name
    @player_name
  end

  def get_score
    @score
  end

  def play_turn
    player_card = @deck.get_card
    computer_card = @deck.get_card
    p @player_name+ " drew card "+player_card.to_s
    p "Computer drew card "+computer_card.to_s

    if player_card < computer_card
      p "Your card is lower!"
      @score-=1
    else
      p "Your card is higher!"
      @score+=1
    end
  end

  def check_turn
    @score > -2 and @deck.get_deck_count > 0
    # p @deck.get_deck_count
  end
end

p "What is your name?"
current_game = Game.new(gets.chomp)

while (current_game.check_turn)
  current_game.play_turn
end

p "Your final score is #{current_game.get_score.to_s} points"