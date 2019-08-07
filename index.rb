class Cards
    def initialize
        @cards = []
        suits = ["Clubs","Hearts","Spades","Diamonds"]
        special = ["King","Queen","Jack"]
        suits.each{|suit|
            (2..10).each{|num|
                @cards.push({
                    :card => num.to_s,
                    :suit => suit,
                    :value => num
                })
            }

            special.each{|card|
                @cards.push({
                    :card => card,
                    :suit => suit,
                    :value => 10
                })
            }

            @cards.push({
                :card => "Ace",
                :suit => suit,
                :value => 11
            })


        }
        player_score = 0
        bot_score = 0
    end

    def shuffled_deck
        return @cards.shuffle
    end

end

class Bets
    def initialize (num)
        @player_pocket = num
        @player_bets = 0
    end

    def update_bet(num)
        @player_bets = num
    end

    def get_pocket
        return @player_pocket
    end

    def calculate (condition)
        if condition == "win"
            @player_pocket = @player_pocket+@player_bets
        else
            @player_pocket = @player_pocket-@player_bets
        end
    end
end


class Game
    def initialize
        @card = nil
        @score = 0
        @player_card = []
        @bot_card = []
        @player_score = 0
        @bot_score = 0
        @player_ace = 0
        @bot_ace = 0
    end

    def shuffle_deck
        @card = Cards.new
        @card = @card.shuffled_deck
    end
    def initialize_player_bot
        @player_card = []
        @bot_card = []
    end

    def get_player_card
        text = @player_card.map{|x|
            "#{x[:card]} of #{x[:suit]}"
        }
        puts text.join("\n")

    end

    def get_bot_card
        text = @bot_card.map{|x|
            "#{x[:card]} of #{x[:suit]}"
        }
        puts text.join("\n")
    end

    def get_player_score
        return @player_score
    end

    def get_bot_score
        return @bot_score
    end

    def draw_2_cards
        @player_card.push(@card.pop)
        @player_score = @player_score + @player_card[-1][:value]
        if @player_card[-1][:card] == "Ace"
            @player_ace = @player_ace +1
        end
        @bot_card.push(@card.pop)
        @bot_score = @bot_score + @bot_card[-1][:value]
        if @bot_card[-1][:card] == "Ace"
            @bot_ace = @bot_ace +1
        end
        @player_card.push(@card.pop)
        @player_score = @player_score + @player_card[-1][:value]
        if @player_card[-1][:card] == "Ace"
            @player_ace = @player_ace +1
        end
        self.ace_points_balance("player")
        puts @player_ace
        puts @bot_ace

    end

    def show_all (name)
        puts "//////////////////////////////////////////////////////"
        puts "#{name}'s cards: #{self.get_player_score}"
        self.get_player_card
        puts
        puts "Bot's cards: #{self.get_bot_score}"
        self.get_bot_card
        puts "//////////////////////////////////////////////////////"
    end

    def check_player_blackjack
        if @player_score ==21
            return true
        else
            return false
        end
    end

    def hit_card(player)
        if player == "player"
            @player_card.push(@card.pop)
            @player_score = @player_score + @player_card[-1][:value]
            if @player_card[-1][:card] == "Ace"
                @player_ace = @player_ace +1
                puts @player_ace
            end
        elsif player == "bot"
            @bot_card.push(@card.pop)
            @bot_score = @bot_score + @bot_card[-1][:value]
            if @bot_card[-1][:card] == "Ace"
                @bot_ace = @bot_ace +1
                puts @bot_ace
            end
        end
    end

    def check_over_21(player)
        if(player == "player")
            if self.get_player_score>21
                return true
            else
                return false
            end
        else
            if self.get_bot_score>21
                return true
            else
                return false
            end
        end

    end

    def check_over_16
        if self.get_bot_score>16
            return true
        else
            return false
        end
    end

    def check_final
        if self.get_player_score>self.get_bot_score
            return 1
        elsif self.get_player_score<self.get_bot_score
            return -1
        else
            return 0
        end
    end

    def ace_points_balance(player)
        if player == "player"

            if @player_score>21 && @player_ace>0
                @player_score = @player_score - 10
            end
        else

            if @bot_score>21 && @bot_ace>0
                @bot_score = @bot_score - 10
            end
        end
        puts @player_ace
        puts @bot_ace

    end


end

gameOn = true

while gameOn

    print "Please input your name: "
    player_name = gets.chomp

    puts

    print "How much do you want to cash in? : "
    amount = gets.chomp
    bets = Bets.new(amount.to_i)

    puts "Do you wanna start the game #{player_name}? (y/n)"
    start_game = gets.chomp
    puts
    if(start_game == "y")

        newGame = true

        while newGame
            puts "Your total chips :#{bets.get_pocket}"
            print "How much do you wanna bet for this round? :"
            bet_amount = gets.chomp
            puts
            if bets.get_pocket<bet_amount.to_i
                puts "You dont have enough chips to bet that amount!!! Please try again"
            else
                bets.update_bet(bet_amount.to_i)
                game = Game.new
                game.shuffle_deck
                game.draw_2_cards
                game.show_all(player_name)
                if game.check_player_blackjack
                    puts "#{player_name} get BLACKJACK, you win!"
                    bets.calculate("win")
                else
                    player_turn = true
                    bot_turn = false

                    while player_turn
                        print "Do you want to hit or stay?(hit/stay)"
                        choice = gets.chomp
                        puts
                        if choice == "hit"
                            game.hit_card("player")
                            game.ace_points_balance("player")
                            game.show_all(player_name)
                            if game.check_over_21("player")
                                puts"You are over 21, #{player_name} LOSE"
                                player_turn = false
                                bets.calculate("lose")
                            else
                                next
                            end
                        elsif choice == "stay"
                            bot_turn = true
                            player_turn = false

                        else
                            puts"please enter something valid"
                        end
                    end

                    while bot_turn
                        game.hit_card("bot")
                        game.ace_points_balance("bot")
                        game.show_all(player_name)
                        if game.check_over_16
                            if game.check_over_21("bot")
                                puts "Bot score over 21, YOU WIN!"
                                bot_turn = false
                                bets.calculate("win")
                            else
                                if game.check_final >0
                                    puts "#{player_name} WINS"
                                    bot_turn = false
                                    bets.calculate("win")
                                elsif game.check_final<0
                                    puts "Bot WINS! #{player_name} LOST"
                                    bot_turn = false
                                    bets.calculate("lose")
                                else
                                    puts "IT IS A DRAW, WHAT A SHAME"
                                    bot_turn = false
                                end

                            end
                        else
                            next
                        end
                    end


                end
                if bets.get_pocket >0
                    correct_input = true
                    while correct_input
                        puts "Your current chips are: #{bets.get_pocket}"
                        print "Do you still want to continue #{player_name}?(y/n)"
                        continueGame = gets.chomp
                        puts
                        if continueGame == "y"
                            game.initialize_player_bot
                            correct_input = false
                            next

                        elsif continueGame == "n"
                            newGame =false
                            gameOn = false
                            correct_input = false
                        else
                            puts "invalid input"
                        end
                    end
                else
                    puts "You dont have anymore chips left! GO HOME #{player_name}"
                    newGame = false
                    gameOn = false
                end
            end
        end

    else
        gameOn = false
    end

end

