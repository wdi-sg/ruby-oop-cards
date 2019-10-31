class Cards

    # Create an array of cards with values 1 - 52 using Code Blocks
    cards = []
    cardNum = 1

    until cardNum > 52 do
        cards.push(cardNum)
        cardNum += 1
    end

    puts cards

end

# Call the function
Cards