# puts ("Hello World");
puts "What is player one name?"
$p_one_name = gets.chomp

# puts "What is player two name?"
# $p_two_name = gets.chomp

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
    puts "#{$p_one_name} Card is " + @player_one_hand[0].to_s;

    @player_two_hand.push(@new_deck.pop);
    puts "Computer Card is " +  @player_two_hand[0].to_s;

    if @player_one_hand[0] > @player_two_hand[0]

      @player_one_point = @player_one_point + @amount + @amount
      @player_two_point = @player_two_point
      # puts @player_one_point
      puts "#{$p_one_name} won the round!"
      puts "#{$p_one_name} point is " + @player_one_point.to_s
      puts "#Computer point is " + @player_two_point.to_s
     else
      # puts "Player 2 Wins"
      @player_two_point = @player_two_point + @amount + @amount
      @player_one_point = @player_one_point
      puts "#Computer won the round!"
      puts "#{$p_one_name} point is " + @player_one_point.to_s
      puts "#Computer point is " + @player_two_point.to_s
    end

    if @player_one_point == -2
      puts "#Computer WINS!"
    elsif @player_two_point == -2
      puts "#{$p_one_name} WINS!"
    end

    # if @player_one_point < -2
    #   puts "Player Two Wins"
    # elsif @player_two_point < -2
    #   puts "Player One Win"
    # end
  end

  def calculate
    puts "#{$p_one_name} point is " + @player_one_point.to_s
    puts "#Computer point is " + @player_two_point.to_s
  end

  def bet(amount)
    puts amount.to_s + " bet!"
    @amount = amount
    # puts @amount.to_s + "esfvdgrdfbf"
    @player_one_point = @player_one_point - amount
    @player_two_point = @player_two_point - amount
    puts @player_one_point.to_s + "ewfwefwef"
    puts @player_two_point.to_s + "etgerfv c"
  end

end

game_round = Game.new(card_deck.cards, 3, 3);
# print game_round.deck

# game_round.bet(1);

until game_round.player_one_point <= -2 || game_round.player_two_point <= -2
  puts "Bet amount?"
  bet_amount = gets.chomp
  game_round.bet(bet_amount.to_i)

  puts game_round.player_one_point.to_s + "AFDSafds"

  game_round.draw
  game_round.deal
  puts "Do you still want to continue? Y/N"
  player_answer = gets.chomp.upcase
  if player_answer == 'N'
    break
  end
end

game_round.calculate