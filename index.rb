class Card

    def initialize
      @cards = []
    end

    def add_card(card)
      @cards.push(card)
    end

    def see_cards
      return @cards
    end

end


puts 'creating game'
new_game = Card.new
puts 'done initializing'


puts 'putting cards into array'
i = 1
until i == 53 do
  new_game.add_card(i)
  # puts "card number is:  " + i.to_s
  i += 1
end
puts 'done putting cards into array'


puts "This is the array of cards: #{new_game.see_cards}"