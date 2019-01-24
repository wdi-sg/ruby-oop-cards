require './card'
require './card_manager'
require 'byebug'

class Game

    attr_accessor :card_manager, :player_hand, :com_hand, :player_score

    def initialize
        @card_manager = CardManager.new
        @player_hand, @com_hand = nil
        @player_score = 0
    end

    def draw
        @com_hand = @card_manager.draw
        @player_hand = @card_manager.draw
    end

    def player_won_round
        @card_manager.compare(@player_hand, @com_hand)
    end

    def score
        if player_won_round
            @player_score += 1
        else
            @player_score -= 1
        end
        discard
    end

    def discard
        @card_manager.discard(@player_hand, @com_hand)
        @player_hand, @com_hand = nil
    end
end