# puts ("Hello World");

class Card

  def initialize(cards)
  @cards = cards
  end

  def cards
    @cards
  end
end

card_deck = Card.new((1..52).to_a);
# card_deck2 = Card.new((1..80).to_a);

# print card_deck.cards

class Game

  def initialize(deck, player_one_point, player_two_point)
    @deck = deck
    @player_one_point = player_one_point
    @player_two_point = player_two_point
  end

  def deck
    @deck
  end

  def draw
    @new_deck = deck.shuffle
    # print @new_deck
  end

  def player_one_point
    @player_one_point
  end

  def player_two_point
    @player_two_point
  end

  def deal
    @player_one_hand = [];
    @player_two_hand = [];

    @player_one_hand.push(@new_deck.pop);
    puts "Player 1 Card is " + @player_one_hand[0].to_s;

    @player_two_hand.push(@new_deck.pop);
    puts "Player 2 Card is " +  @player_two_hand[0].to_s;

    if @player_one_hand[0] > @player_two_hand[0]

      @player_one_point = @player_one_point + 1
      @player_two_point = @player_two_point - 1
      # puts @player_one_point
      puts "player one point is " + @player_one_point.to_s
      puts "player two point is " + @player_two_point.to_s
     else
      # puts "Player 2 Wins"
      @player_two_point = @player_two_point + 1
      @player_one_point = @player_one_point - 1
      puts "player one point is " + @player_one_point.to_s
      puts "player two point is " + @player_two_point.to_s
    end

    if @player_one_point == -2
      puts "PLAYER TWO WINS!"
    elsif @player_two_point == -2
      puts "PLAYER ONE WINS!"
    end

    # if @player_one_point < -2
    #   puts "Player Two Wins"
    # elsif @player_two_point < -2
    #   puts "Player One Win"
    # end
  end

end

game_round = Game.new(card_deck.cards, 0, 0);
# print game_round.deck


until game_round.player_one_point == -2 || game_round.player_two_point == -2
  game_round.draw
  game_round.deal
end



# game_round.draw
# game_round.deal
# game_round.deal
# game_round.deal
# game_round.player_one_point
# game_round.player_two_point