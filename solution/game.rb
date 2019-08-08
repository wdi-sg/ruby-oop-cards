class Game
  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []

  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card

    puts "******************************"
    puts "Your Hand: #{user_hand}"
    puts "******************************"
    puts "House Hand: #{house_hand}"
    puts "******************************"

    puts @deck.suits[user_hand[1] ]

    if user_hand[0] > house_hand[0]
      @score += 1
      puts "You win this hand!"
      @hands << 'Player'
    elsif  user_hand[0] < house_hand[0]
      @score -= 1
      puts "House wins!"
      @hands << 'House'
    elsif @deck.suits[user_hand[1] ] > @deck.suits[house_hand[1] ]
      @score += 1
      @hands << 'Player'
    else
      @score -= 1
      @hands << 'House'
    end
    puts "\n \n \n"
    puts "cards left #{@deck.cards_left}"
    if @deck.cards_left < 20
        @deck.respawn_cards
    end
  end

  def check_game
      @score
  end

  def get_hands
      @hands
  end

  def report_summary
      won = 0;
      won = @hands.each.count('Player')
      puts "\033[0m\Games Played : #{@hands.length}"
      puts "Games Won : #{won}"
  end

end
