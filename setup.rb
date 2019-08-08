#game start
cards = *(1..52)
computer_score = 0
player_score = 0
computer_hand = []
player_hand = []
round = 0
p cards

# Ask player would you like to play a game
# Initialise game , let user know the rules
# Ask player would you like to continue
# game ends if use say no or either computer or user get -2


#each turn
round = round + 1
p "Round " + round.to_s
#shuffle cards
cards = cards.shuffle()
p cards

#draw a card each for computer and player
computer_draws = cards.pop()
player_draws = cards.pop()

#show cards
p computer_draws
p player_draws

computer_hand.push(computer_draws)
player_hand.push(player_draws)

p "computer's hand: " + computer_hand.join(",")
p "player's hand': " + player_hand.join(",")

#outcome
if computer_draws > player_draws
  puts "computer wins this round"
  computer_score = computer_score + 1
  player_score = player_score - 1

else
  puts "player wins this round"
  player_score = player_score + 1
  computer_score = computer_score - 1
end

puts "computer score: " + computer_score.to_s
puts "player score: " + player_score.to_s

#for checking current cards stack
p (cards.length).to_s + " cards left"

# and the round begins again


#each turn
round = round + 1
p "Round " + round.to_s
#shuffle cards
cards = cards.shuffle()
p cards

#draw a card each for computer and player
computer_draws = cards.pop()
player_draws = cards.pop()

#show cards
p computer_draws
p player_draws

computer_hand.push(computer_draws)
player_hand.push(player_draws)

p "computer's hand: " + computer_hand.join(",")
p "player's hand': " + player_hand.join(",")

#outcome
if computer_draws > player_draws
  puts "computer wins this round"
  computer_score = computer_score + 1
  player_score = player_score - 1

else
  puts "player wins this round"
  player_score = player_score + 1
  computer_score = computer_score - 1
end

puts "computer score: " + computer_score.to_s
puts "player score: " + player_score.to_s

#for checking current cards stack
p (cards.length).to_s + " cards left"
