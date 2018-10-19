class Cards
  attr_accessor :cards

  def initialize
    @cards = (1..52).to_a
  end

  def get_card
    @cards.shuffle!.pop
  end
end

class Game
  attr_accessor :cards
  attr_accessor :deck

  def initialize
    @deck = Cards.new
    @score = 0
    @discard = []
  end

  def deck_empty
    @deck.cards.size <= 1
  end

  def play
    user_hand = @deck.get_card
    house_hand = @deck.get_card
    @discard << [user_hand, house_hand]
    cardsleft = @deck.cards.size

    puts "user card: #{user_hand} and house card: #{house_hand} cards left: #{cardsleft}"

    if user_hand > house_hand
      @score += 1
    else
      @score -= 1
    end
  end

  def check_game
    @score
  end

  puts 'Do you want to play a card game?'
  input = gets.chomp

  if input == 'yes'
    puts 'Input your name'
    name = gets.chomp
    playing = true
    game = Game.new
  else
    puts 'See you again!'
  end

  while playing

    game.play

    puts "Hello #{name}, your current score is: #{game.check_game}"
    puts 'do you want to continue?'
    answer = gets.chomp.to_s
    if answer == 'no'
      puts "final score: #{game.check_game}"
      break
    end

    if game.check_game < -2
      playing = false
      puts 'game ends'
      break
    elsif @deck.cards.size <= 1
      puts "No more cards to play! Final score: #{game.check_game}"
      break
    end
  end
end