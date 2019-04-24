class Card
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
  end

  ######################
  # get methods
  ######################
  def suite()
    @suite
  end

  def number()
    @number
  end

  def name()
    @name
  end

  def suite_weightage()
    @suite_weightage
  end
end