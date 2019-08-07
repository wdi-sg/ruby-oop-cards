class Card

    def initialize
      @cards = []
    end

    def generating_cards
        i = 1
        until i == 53 do
            @cards.push(i)
            i += 1
        end
    end

    def see_cards
      return @cards
    end

end

class Card_game

    def initialize
      @draw = []
      @point1 = []
      @point2 = []
      @point_1 = 0
      @point_2 = 0
    end

    def draw_card(card)
        i = 0
        until i == card.length do
          @draw.push(card[i])
          i += 1
        end
    end

    def check_for_win(points)
        if @draw[0]>@draw[1]
          puts "You win this round"
          @point1.push(@draw[0])
          @point_1 += 1
          @point_1 += points.to_i
          @point_2 -= points.to_i
        else
          puts "You lose this round"
          @point2.push(@draw[1])
          @point_2 += 1
          @point_1 -= points.to_i
          @point_2 += points.to_i
        end
        @draw = []
    end

    def see_hand
      return @draw
    end

    def show_points
      return @point_1
    end

    def show_points2
      return @point_2
    end

end


puts "Hello stranger. What is your name?"
player_name = gets.chomp
puts " "
puts " "
puts " "
card_deck = Card.new
new_game = Card_game.new
puts "Hello #{player_name}. Do you want to play the game?"
answer = gets.chomp
puts " "
puts " "
puts " "
card_deck.generating_cards
all_cards = card_deck.see_cards
# puts "These are the cards: #{all_cards}"
all_cards = all_cards.shuffle
# puts "this is the sshuffled card #{all_cards}"
puts 'The deck is being shuffled'
puts " "
puts " "
puts " "
puts "#{player_name}, lets bet on your score"
i = all_cards.length/2
until i == 0 || answer == 'no' do
    if answer == 'yes'
        puts "How much points do you want to bet?"
        answer3 = gets.chomp
        puts " "
        puts " "
        puts " "
        first_two_card = all_cards.slice!(0,2)
        puts "Your card is : #{first_two_card[0]}"
        puts "Your opponent card is: #{first_two_card[1]}"
        new_game.draw_card(first_two_card)
        new_game.check_for_win(answer3)
        i -= 1
    end
    puts " "
    puts " "
    puts " "
    score = new_game.show_points
    score_oppo = new_game.show_points2
    puts "this is your current score #{score}"
    puts "this is your opponent score #{score_oppo}"
    puts "You have #{i} rounds left. Do you still want to continue?"
    answer = gets.chomp
    puts " "
    puts " "
    puts " "
end
score = new_game.show_points
puts "Your points: #{score}"



# puts 'creating card deck'
# card_deck = Card.new
# # puts 'done initializing'


# # puts 'putting cards into array'
# i = 1
# until i == 53 do
#   card_deck.add_card(i)
#   # puts "card number is:  " + i.to_s
#   i += 1
# end
# # puts 'done putting cards into array'

# cards = card_deck.see_cards

# # puts "This is the array of cards: #{cards}"

# cards = cards.shuffle

# # puts "This is the array of shuffled cards: #{cards}"

# first_two_card = cards.slice(0,2)

# # puts "this is the first two cards: #{first_two_card}"

# # puts 'creating the game'
# new_game = Card_game.new
# # puts 'done creating game'

# # puts 'lets play the game'
# i = 0
# until i == first_two_card.length do
#   new_game.draw_card(first_two_card[i])
#   i += 1
# end

# card_hand = new_game.see_hand

# puts "this is the cards at hand: #{card_hand}"

# if card_hand[0]>card_hand[1]
#   new_game.winning_hand
# else
#   new_game.losing_hand
# end

# player_score = new_game.show_points

# puts "this is the player score: #{player_score}"