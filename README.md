# ruby-oop-cards
![https://media.giphy.com/media/w1ZEcSm7LiuLC/giphy.gif](https://media.giphy.com/media/w1ZEcSm7LiuLC/giphy.gif)

Create a game of cards using ruby objects.

1. Create a card class that, when you initialize it, creates an array of "cards" that are of value 1-52.

1. Create a game class that uses the card class to play a game.
  - when you play the game, draw two cards from the deck.
  - if the player has the highest card, give them a point.
  - if the player doesn't have the highest card, deduct a point.
  - if the player's score is less than -2, end the game.

1. Inside the game class, keep a record of each hand played in an instance variable array.

1. show the score to the player

### Hints:
Use `gets.chomp` to get input from the user.
Use a while loop for each turn of the game.
Look in the `solution/play.rb` if you're not sure how to write the game loop
Look in the solution class files if you forget the syntax of ruby classes

# further
Ask the player for their name at the beggining of the game, and print it out at each turn.
Example: "hello Ray, you have 10 points."

# further
On each turn, ask the player if he wants to continue with the game.
If he says no, end the game and output the final score.

# further
Implement betting inside the game class.
Before each turn allow the user to make a wager from his current points.

# further
Change the card class to reflect an actual deck of cards.
You can choose to make each card a class instance if you want.
You will have to change the winning card logic.
You can use these rules: [https://en.wikipedia.org/wiki/High_card_by_suit](https://en.wikipedia.org/wiki/High_card_by_suit)

# further
Implement a blackjack game.
