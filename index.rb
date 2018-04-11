require 'byebug'

class Card
    def initialize
        @deck = []
        for i in 1..52
            @deck.push(i)
        end
        # @card = [0]
    end

    def draw_card
        @first_card = @deck.shuffle.first
        # @first_card = @deck.shuffle.first
        # @card.unshift(@first_card)
        # @card[0]
    end

    def draw_next_card
        @next_deck = @deck.reject {|i| i == @first_card}
        @second_card = @next_deck.shuffle.first
        # @second_card = @deck.shuffle.first
        # while @second_card[0] == @card[0]
        #     @second_card = @deck.shuffle.first
        # end
        # @second_card[0]
    end
end

class Game
    def initialize
        @start_draw = Card.new
        @one_point = 0
        @two_point = 0
    end

    def score_board_one
        @one_point
    end

    def score_board_two
        @two_point
    end

    def game_point_one
        @one_point += 1
        @two_point -= 1
    end

    def game_point_two
        @two_point += 1
        @one_point -= 1
    end

    def round
        if @start_draw.draw_card > @start_draw.draw_next_card
            puts "Jerry's Card: #{@start_draw.draw_card} vs AI's Card: #{@start_draw.draw_next_card}"
            game_point_one
        elsif @start_draw.draw_card < @start_draw.draw_next_card
            puts "Jerry's Card: #{@start_draw.draw_card} vs AI's Card: #{@start_draw.draw_next_card}"
            game_point_two
        else
            puts "How is that possible?"
        end
    end
end

running = true

game = Game.new

puts "What is your name?"
player_one = gets.chomp

while running == true
    puts " Hi #{player_one}, your score is: #{game.score_board_one.to_s}"

    puts "Do you want to play this hand? (y/n/quit)"
    input = gets.chomp

    if input == "n"
        puts "How you know my card is good?"
        next
    elsif input == "quit"
        puts "Are you afraid I might win?"
        return running = false
    elsif input == "y"
        running = true
    else
        puts "Invalid Input"
        next
    end

    game.round

    if game.score_board_one < -2
        puts "You poor maggot. You can't even beat an AI!"
        running = false
    elsif game.score_board_two < -2
        puts "You won but can you beat me again?"
        running = false
    else
        running = true
    end
end

byebug

puts "hello"
