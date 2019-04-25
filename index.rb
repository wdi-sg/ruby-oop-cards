# ============================================
# Class to create cards with numbers and suits
# ============================================

class Cards
    def initialize
        @cards = []
        suits = ["diamonds", "clubs", "hearts", "spades"]
        suits.each do |suit|
        i = 1
            13.times do
                @cards << "#{i.to_s},#{suit}"
                i += 1
            end
        end
    end

    # def cards
    #     @cards
    # end

    attr_accessor :cards

    def show_hand
        @cards.shuffle.first.split(',')
    end
end

# ==========
# Game logic
# ==========

class Game
    def initialize
        @deck = Cards.new
        @score = 0
        @hands = []
        @handsHistory = []
    end
    def play_game
        user_hand = @deck.show_hand
        house_hand = @deck.show_hand

        @hands = []
        @hands << [user_hand, house_hand]
        @handsHistory << [user_hand, house_hand]

        # Print some shit
        puts "CURRENT PLAYING HAND: (PLAYER, COMPUTER)"
        # print actually prints array elements line by line like wtf
        # print @hands
        print @hands
        puts
        puts "HISTORY OF DEALT HANDS"
        print @handsHistory
        puts

        # =========================
        # Winning/losing conditions
        # =========================

        # Compare card numbers
        if user_hand.first.to_i > house_hand.first.to_i
            @score += 1
        elsif user_hand.first.to_i == house_hand.first.to_i
            # If card numbers match, compare suits
            if (user_hand.last == "spades" && ["hearts", "clubs", "diamonds"].include?(house_hand.last))
                @score += 1
            elsif (user_hand.last == "hearts" && ["clubs", "diamonds"].include?(house_hand.last))
                @score += 1
            elsif (user_hand.last == "clubs" && ["diamonds"].include?(house_hand.last))
                @score += 1
            else
                @score -= 1
            end
        elsif user_hand.first.to_i < house_hand.first.to_i
            @score -= 1
        end
    end

    def play_gamble
        user_hand = @deck.show_hand
        house_hand = @deck.show_hand

        @hands = []
        @hands << [user_hand, house_hand]
        @handsHistory << [user_hand, house_hand]
        puts "CURRENT PLAYING HAND, (PLAYER, COMPUTER)"
        print @hands
        puts
        puts "PLAYING HISTORY"
        print @handsHistory
        puts

        if user_hand.first.to_i > house_hand.first.to_i
            @score = @score * 2
        elsif user_hand.first.to_i == house_hand.first.to_i
            if (user_hand.last == "spades" && ["hearts", "clubs", "diamonds"].include?(house_hand.last))
                @score = @score * 2
            elsif (user_hand.last == "hearts" && ["clubs", "diamonds"].include?(house_hand.last))
                @score = @score * 2
            elsif (user_hand.last == "clubs" && ["diamonds"].include?(house_hand.last))
                @score = @score * 2
            else
                @score = 0
            end
        elsif user_hand.first.to_i < house_hand.first.to_i
            @score = 0
        end
    end

    # def score
    #     @score
    # end

    attr_accessor :score
end

# ===============
# Initialize game
# ===============

# Get player input for name
puts "ayo whats ur name"
name = gets.chomp

# Setting a variable condition on whether to continue/stop the game
gameplay = true

# Start game
game = Game.new
game.play_game

# Game continues until gameplay is false
while gameplay == true

    # Prints name of player and cumulated points
    puts "oi #{name} u got this much points: #{game.score.to_i}"

    # Get player input on whether to continue game or not
    puts "still wna play or not?"
    input = gets.chomp.to_s

    # Checks for input response
    if input == "no"
        puts "u wuss, heaven frowns upon ur behaviour"
        puts "but here's ur meager score"
        puts game.score.to_i
        # Calls for game to stop
        gameplay = false
    else
        # Ask if player wants to go ham
        puts "ALL OR NOTHING?? do it i dare u"
        gamble = gets.chomp.to_s
        if gamble == "yes"
            # Checks if player got the moolah to go ham
            if game.score.to_i == 0
                # Scold player then start game without "all or nothing"
                puts "u gamble w what pooints sia talk cock go play normal"
                game.play_game
            elsif game.score.to_i < 0
                puts "bro negative you win is lose you lsoe also lose got think or not"
                game.play_game
            else
                # All checks passed and ready to go hard
                game.play_gamble
            end
        else
            # Continue playing game normally if "no" to gamble
            game.play_game
        end
    end

    # Stop game if player is a major loser
    if game.score.to_i == -2
        gameplay = false
        puts "U LOSE GAME OVER NOW GO GET A JOB"
    end
end