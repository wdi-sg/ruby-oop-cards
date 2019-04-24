class Player

  ###############
  # constructor
  ###############
  def initialize(name, score)
    @name = name
    @score = score
  end

  ######################
  # get methods
  ######################
  def score()
    @score
  end

  ######################
  # methods
  ######################
  def add_score()
    @score += 1
  end

  def deduct_score()
    @score -= 1
  end

end