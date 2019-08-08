#create card
class Cards

  def initialize
    @cards= []
#times loop and starts counting from 0
    52.times do |x|
#push x to card array
    @cards.push(x)
    end
  end

  def issue
#returns returns first element of shuffled array
      @cards.shuffle.first
  end

end

currentCard = Cards.new

#~~~~~~~~~~~~~~~~~~~~~

#create game with how to play and rules
class Game

  def initialize
    @p1score=0
    @playedCards=[]
  end

#players get cards
  def play
    p1card = currentCard.issue
    comcard = currentCard.issue

    @playedCards.push(p1card, p2card)

#determine score
#if the player has the highest card, give them a point.
#if the player doesn't have the highest card, deduct a point.
    if p1card > comcard
      @p1score +=1
  else
      @p1score -=1
    end
  end

end

currentGame=Game.new

#game loop
#if the player's score is less than -2, end the game.

while p1score >= -2

  currentGame.play
  p p1score
  p @played