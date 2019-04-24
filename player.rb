class Player

  ###############
  # constructor
  ###############
  def initialize(name, score)
    @name = name
    @score = score
  end

  ######################
  # get and set methods
  ######################
  def name()
    @name
  end

  def score()
    @score
  end

  def set_score(score)
    @score = score
  end

end