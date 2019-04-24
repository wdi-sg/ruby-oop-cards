# CREATE DECK

class Card_deck
  def initialize
    # create card type and number
    @deck = []
    suites = ['Clubs', 'Diamonds','Hearts', 'Spades']
    card_values = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    i = 1
    suites.each do |type| card_values.each do |n|
      @deck << [i ,n, type]
      i+=1
      end
    end
  end

  def get_card
    # num = rand(0..@deck.length-1)
    @value_of_card = @deck.shuffle.first
    @value_of_card
    # "hello your drew a card valued at #{@value_of_card[0]}...suited at  #{@value_of_card[1]} .... CARDS LEFTTTT in DECK #{@deck.length}"
  end

  def show_deck
    @deck.shuffle.pop
  end
end