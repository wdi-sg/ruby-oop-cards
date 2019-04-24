require './card'

class Cards
  ###############
  # constructor
  ###############
  def initialize()
    @cards = [];

    (2..14).each do |number|
      ["diamonds", "clubs", "hearts", "spades"].each do |suite|
        card = Card.new(number, suite)
        @cards.push(card)
      end
    end

  end

  ######################
  # get methods
  ######################
  def cards()
    @cards
  end

end