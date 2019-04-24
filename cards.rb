class Cards
  ###############
  # constructor
  ###############
  def initialize()
    @cards = (1..52).to_a.shuffle
  end

  ######################
  # get methods
  ######################
  def cards()
    @cards
  end

end