# require 'byebug'

class Cards

  def initialize()
    @cards=(1..52).to_a.shuffle!
  end

  def check_existing_cards
    @cards
  end

  def check_num_of_cards
    @cards.length
  end

  def get_card
    @cards.slice!(0)
  end
  
  def shuffle_deck
    @cards.shuffle!
  end

end


# byebug
puts "something"