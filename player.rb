class Player

  attr_accessor :name, :score

  ###############
  # constructor
  ###############
  def initialize(name, score)
    @name = name
    @score = score
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