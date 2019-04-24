class Card

  attr_accessor :number, :suite, :name, :suite_weightage, :symbol

  ###############
  # constructor
  ###############
  def initialize(number, suite)
    @number = number
    @suite = suite

    if number.between?(2, 10)
      @name = number.to_s
    elsif (number == 11)
      @name = "jack"
    elsif (number == 12)
      @name = "queen"
    elsif (number == 13)
      @name = "king"
    elsif (number == 14)
      @name = "ace"
    end

    if (suite == "diamonds")
      @suite_weightage = 1
    elsif (suite == "clubs")
      @suite_weightage = 2
    elsif (suite == "hearts")
      @suite_weightage = 3
    elsif (suite == "spades")
      @suite_weightage = 4
    end

    if (suite == "diamonds")
      @symbol = "♦"
    elsif (suite == "clubs")
      @symbol = "♣"
    elsif (suite == "hearts")
      @symbol = "♥"
    elsif (suite == "spades")
      @symbol = "♠"
    end
  end
end