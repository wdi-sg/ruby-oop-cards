class Deck
    def initialize
        @faces=[2,3,4,5,6,7,8,9,10,'J','Q','K','A']
        @suits=['Club','Diamond','Hearts','Spades']
        @cards=[]


        #loop through each face
        #then loop through each suit for that face
        #to generate 1 of every combo

        @faces.each do |face|
            #if face is a number make value = face
            if face.class == Integer
                value = face
                #if face is an Ace make value = 11
            elsif face =='A'
                value = 11
                #otherwise we have a face card that has a value of 10
            else
                value = 10
            end
            @suits.each do |suit|
                @cards << Card.new(face,suit,value)
            end
        end

        #shuffles the array of cards
        @cards.shuffle!
    end

    def deal_card
        @cards.shuffle.pop
    end
end

