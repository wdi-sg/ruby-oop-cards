require './cards'

class Game
  attr_accessor :point

  def initialize(point)
    @point = point
  end

  def new_Game
    cardStack = Cards.new()
    cardResult = cardStack.drawTwoCard()

    puts "First card: " + cardResult[0].to_s + ", second card:" + cardResult[1].to_s

    if cardResult[0] == 52 || cardResult[1]== 52
        @point = @point + 1
    else
      @point = @point -1
    end
  end

end