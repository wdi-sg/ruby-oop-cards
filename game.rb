# GAME FUNCTIONS

class Game

  def initialize
    @deck = Card_deck.new
    @score = 0
    @hands = []

    # @playerCard =
  end

  def play
    player_draw = @deck.get_card
    house_draw = @deck.get_card

    @hands << [player_draw, house_draw]

    if player_draw[1] > house_draw[1]
      puts "YOU drew a #{player_draw[1]} of #{player_draw.last}, HOUSE drew a #{house_draw[1]} of #{house_draw.last}"
      @score += 1

    elsif player_draw[1] == house_draw[1]
      # puts "YOU drew a #{player_draw[1]} of #{player_draw.last}, HOUSE drew a #{house_draw[1]} of #{house_draw.last}"
      if player_draw[2] == house_draw[2]
        puts "YOU drew a #{player_draw[1]} of #{player_draw.last}, HOUSE drew a #{house_draw[1]} of #{house_draw.last}"
        @score += 0
      elsif player_draw[2] == 'Spades' && house_draw[2] == 'Hearts' || house_draw[2] == 'Diamonds' || house_draw[2] == 'Clubs'
        puts "YOU drew a #{player_draw[1]} of #{player_draw.last}, HOUSE drew a #{house_draw[1]} of #{house_draw.last}"
        @score += 1
      elsif player_draw[2] == 'Hearts' && house_draw[2] == 'Diamonds' || house_draw[2] == 'Clubs'
        puts "YOU drew a #{player_draw[1]} of #{player_draw.last}, HOUSE drew a #{house_draw[1]} of #{house_draw.last}"
        @score += 1
      elsif player_draw[2] == 'Diamonds' && house_draw[2] == 'Clubs'
        puts "YOU drew a #{player_draw[1]} of #{player_draw.last}, HOUSE drew a #{house_draw[1]} of #{house_draw.last}"
        @score += 1
      end

    else
      puts "YOU drew a #{player_draw[1]} of #{player_draw.last}, HOUSE drew a #{house_draw[1]} of #{house_draw.last}"
      @score -=1
    end
  end


  def game_status
    # puts "Current score: #{@score}"
    @score
  end

  # def deck
  #   @deck.show_deck.length
  # end

  # def cards_left
  #   @deck.show_deck.length
  # end

end