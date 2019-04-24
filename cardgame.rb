# puts ("Hello World");
puts "What is player one name?"
$p_one_name = gets.chomp

# puts "What is player two name?"
# $p_two_name = gets.chomp
arr = [1,2,3,4];

puts arr[1] - 1


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
    @player_one_hand.push(@new_deck.pop);

    if @player_one_hand[0] > 0 && @player_one_hand[0] < 14
        if @player_one_hand[0] == 11
        @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Jack Diamonds"

        elsif @player_one_hand[0] == 12
        @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Queen Diamonds"

        elsif @player_one_hand[0] == 13
        @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is King Diamonds"

        elsif @player_one_hand[0] == 1
        @player_one_hand[0] = 11
        puts "#{$p_one_name} Card is Ace Diamonds"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[0].to_s + " Diamonds"
        end

    elsif @player_one_hand[0] > 13 && @player_one_hand[0] < 27
        # @player_one_hand[0] = @player_one_hand[0] - 13
        @player_one_hand[0] = @player_one_hand[0] - 13
        if @player_one_hand[0] == 11
        @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Jack Clubs"

        elsif @player_one_hand[0] == 12
        @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Queen Clubs"

        elsif @player_one_hand[0] == 13
        @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is King Clubs"

        elsif @player_one_hand[0] == 1
        @player_one_hand[0] = 11
        puts "#{$p_one_name} Card is Ace Clubs"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[0].to_s + " clubs"
        end

    elsif @player_one_hand[0] > 26 && @player_one_hand[0] < 40
        # puts @player_one_hand[0]
        @player_one_hand[0] = @player_one_hand[0] - 26
        if @player_one_hand[0] == 11
          @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Jack Hearts"
        elsif @player_one_hand[0] == 12
          @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Queen Hearts"
        elsif @player_one_hand[0] == 13
          @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is King Hearts"

        elsif @player_one_hand[0] == 1
        @player_one_hand[0] = 11
        puts "#{$p_one_name} Card is Ace Hearts"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[0].to_s + " Hearts"
        end

    else
        @player_one_hand[0] = @player_one_hand[0] - 39
        if @player_one_hand[0] == 11
          @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Jack Spades"
        elsif @player_one_hand[0] == 12
          @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is Queen Spades"
        elsif @player_one_hand[0] == 13
          @player_one_hand[0] = 10
        puts "#{$p_one_name} Card is King Spades"

        elsif @player_one_hand[0] == 1
        @player_one_hand[0] = 11
        puts "#{$p_one_name} Card is Ace Spades"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[0].to_s + " Spades"
      end
    end

    if @player_one_hand[1] > 0 && @player_one_hand[1] < 14
        if @player_one_hand[1] == 11
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Jack Diamonds"
        elsif @player_one_hand[1] == 12
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Queen Diamonds"
        elsif @player_one_hand[1] == 13
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is King Diamonds"

        elsif @player_one_hand[1] == 1
        @player_one_hand[1] = 11
        puts "#{$p_one_name} Card is Ace Diamonds"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[1].to_s + " Diamonds"
        end

    elsif @player_one_hand[1] > 13 && @player_one_hand[1] < 27
        @player_one_hand[1] = @player_one_hand[1] - 13
        if @player_one_hand[1] == 11
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Jack Clubs"
        elsif @player_one_hand[1] == 12
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Queen Clubs"
        elsif @player_one_hand[1] == 13
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is King Clubs"

        elsif @player_one_hand[1] == 1
        @player_one_hand[1] = 11
        puts "#{$p_one_name} Card is Ace Clubs"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[1].to_s + " clubs"
        end

    elsif @player_one_hand[1] > 26 && @player_one_hand[1] < 40
        @player_one_hand[1] = @player_one_hand[1] - 26
        if @player_one_hand[1] == 11
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Jack Hearts"
        elsif @player_one_hand[1] == 12
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Queen Hearts"
        elsif @player_one_hand[1] == 13
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is King Hearts"

        elsif @player_one_hand[1] == 1
        @player_one_hand[1] = 11
        puts "#{$p_one_name} Card is Ace Hearts"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[1].to_s + " Hearts"
        end

    else
        @player_one_hand[1] = @player_one_hand[1] - 39
        if @player_one_hand[1] == 11
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Jack Spades"
        elsif @player_one_hand[1] == 12
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is Queen Spades"
        elsif @player_one_hand[1] == 13
          @player_one_hand[1] = 10
        puts "#{$p_one_name} Card is King Spades"

        elsif @player_one_hand[1] == 1
        @player_one_hand[1] = 11
        puts "#{$p_one_name} Card is Ace Spades"

        else
        puts "#{$p_one_name} Card is " + @player_one_hand[1].to_s + " Spades"
      end
    end
    puts "#{$p_one_name} Total is " + @player_one_hand.sum.to_s;

    @player_two_hand.push(@new_deck.pop);
    @player_two_hand.push(@new_deck.pop);

    if @player_two_hand[0] > 0 && @player_two_hand[0] < 14
        if @player_two_hand[0] == 11
          @player_two_hand[0] = 10
        puts "#Computer Card is Jack Diamonds"
        elsif @player_two_hand[0] == 12
          @player_two_hand[0] = 10
        puts "#Computer Card is Queen Diamonds"
        elsif @player_two_hand[0] == 13
          @player_two_hand[0] = 10
        puts "#Computer Card is King Diamonds"

        elsif @player_two_hand[0] == 1
        @player_two_hand[0] = 11
        puts "#Computer Card is Ace Diamonds"

        else
        puts "#Computer Card is " + @player_two_hand[0].to_s + " Diamonds"
        end

    elsif @player_two_hand[0] > 13 && @player_two_hand[0] < 27
        # @player_one_hand[0] = @player_one_hand[0] - 13
        @player_two_hand[0] = @player_two_hand[0] - 13
        if @player_two_hand[0] == 11
          @player_two_hand[0] = 10
        puts "#Computer Card is Jack Clubs"
        elsif @player_two_hand[0] == 12
          @player_two_hand[0] = 10
        puts "#Computer Card is Queen Clubs"
        elsif @player_two_hand[0] == 13
          @player_two_hand[0] = 10
        puts "#Computer Card is King Clubs"

        elsif @player_two_hand[0] == 1
        @player_two_hand[0] = 11
        puts "#Computer Card is Ace Clubs"

        else
        puts "#Computer Card is " + @player_two_hand[0].to_s + " Clubs"
        end

    elsif @player_two_hand[0] > 26 && @player_two_hand[0] < 40
        # puts @player_one_hand[0]
        @player_two_hand[0] = @player_two_hand[0] - 26
        if @player_two_hand[0] == 11
          @player_two_hand[0] = 10
        puts "#Computer Card is Jack Hearts"
        elsif @player_two_hand[0] == 12
          @player_two_hand[0] = 10
        puts "#Computer Card is Queen Hearts"
        elsif @player_two_hand[0] == 13
          @player_two_hand[0] = 10
        puts "#Computer Card is King Hearts"

        elsif @player_two_hand[0] == 1
        @player_two_hand[0] = 11
        puts "#Computer Card is Ace Hearts"

        else
        puts "#Computer Card is " + @player_two_hand[0].to_s + " Hearta"
        end
    else
        @player_two_hand[0] = @player_two_hand[0] - 39
        if @player_two_hand[0] == 11
          @player_two_hand[0] = 10
        puts "#Computer Card is Jack Spades"
        elsif @player_two_hand[0] == 12
          @player_two_hand[0] = 10
        puts "#Computer Card is Queen Spades"
        elsif @player_two_hand[0] == 13
          @player_two_hand[0] = 10
        puts "#Computer Card is King Spades"

        elsif @player_two_hand[0] == 1
        @player_two_hand[0] = 11
        puts "#Computer Card is Ace Spades"

        else
        puts "#Computer Card is " + @player_two_hand[0].to_s + " Spades"
        end
      end

    if @player_two_hand[1] > 0 && @player_two_hand[1] < 14
        if @player_two_hand[1] == 11
          @player_two_hand[1] = 10
        puts "#Computer Card is Jack Diamonds"
        elsif @player_two_hand[1] == 12
          @player_two_hand[1] = 10
        puts "#Computer Card is Queen Diamonds"
        elsif @player_two_hand[1] == 13
          @player_two_hand[1] = 10
        puts "#Computer Card is King Diamonds"

        elsif @player_two_hand[1] == 1
        @player_two_hand[1] = 11
        puts "#Computer Card is Ace Diamonds"

        else
        puts "#Computer Card is " + @player_two_hand[1].to_s + " Diamonds"
        end

    elsif @player_two_hand[1] > 13 && @player_two_hand[1] < 27
        # @player_one_hand[0] = @player_one_hand[0] - 13
        @player_two_hand[1] = @player_two_hand[1] - 13
        if @player_two_hand[1] == 11
          @player_two_hand[1] = 10
        puts "#Computer Card is Jack Clubs"
        elsif @player_two_hand[1] == 12
          @player_two_hand[1] = 10
        puts "#Computer Card is Queen Clubs"
        elsif @player_two_hand[1] == 13
          @player_two_hand[1] = 10
        puts "#Computer Card is King Clubs"

        elsif @player_two_hand[1] == 1
        @player_two_hand[1] = 11
        puts "#Computer Card is Ace Clubs"

        else
        puts "#Computer Card is " + @player_two_hand[1].to_s + " Clubs"
        end

    elsif @player_two_hand[1] > 26 && @player_two_hand[1] < 40
        # puts @player_one_hand[0]
        @player_two_hand[1] = @player_two_hand[1] - 26
        if @player_two_hand[1] == 11
          @player_two_hand[1] = 10
        puts "#Computer Card is Jack Hearts"
        elsif @player_two_hand[1] == 12
          @player_two_hand[1] = 10
        puts "#Computer Card is Queen Hearts"
        elsif @player_two_hand[1] == 13
          @player_two_hand[1] = 10
        puts "#Computer Card is King Hearts"

        elsif @player_two_hand[1] == 1
        @player_two_hand[1] = 11
        puts "#Computer Card is Ace Hearts"

        else
        puts "#Computer Card is " + @player_two_hand[1].to_s + " Hearts"
        end

    else
        @player_two_hand[1] = @player_two_hand[1] - 39
        if @player_two_hand[1] == 11
          @player_two_hand[1] = 10
        puts "#Computer Card is Jack Spades"
        elsif @player_two_hand[1] == 12
          @player_two_hand[1] = 10
        puts "#Computer Card is Queen Spades"
        elsif @player_two_hand[1] == 13
          @player_two_hand[1] = 10
        puts "#Computer Card is King Spades"

        elsif @player_two_hand[1] == 1
        @player_two_hand[1] = 11
        puts "#Computer Card is Ace Spades"

        else
        puts "#Computer Card is " + @player_two_hand[1].to_s + " Spades"
        end
      end


    # puts "Computer Card is " +  @player_two_hand[0].to_s;
    # puts "Computer Card is " +  @player_two_hand[1].to_s;
    puts "#Computer Total is " + @player_two_hand.sum.to_s;

    if @player_one_hand.sum > @player_two_hand.sum

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
    # puts @player_one_point.to_s + "ewfwefwef"
    # puts @player_two_point.to_s + "etgerfv c"
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