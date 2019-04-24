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
  def name()
    @name
  end

  def score()
    @score
  end

  ######################
  # methods
  ######################
  def add_score(n)
    @score += n
  end

  def deduct_score(n)
    @score -= n
  end

end