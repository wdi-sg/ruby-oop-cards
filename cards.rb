puts 'Welcome, what is your name?'
name = gets.chomp
puts "Welcome, #{name}. Let's start by asking the dealer to give you a card."
class Card
  def initialize (card, num)
    @card = card
    @num = num
  end

  def card
    @card
  end

  def cardNum
    @num
  end
end

arr = []
i = 0
while i < 52 do
  arr.push(Card.new("card" + (i+1).to_s, i+1))
  i += 1
end

p arr[34].cardNum

p1_score = 0
p2_score = 0
game_end = false
game_over = false
exit_bet = false
wager = 0


while game_end == false do

  p1_one_card = arr.sample.cardNum
  p2_two_card = arr.sample.cardNum

  hit = gets.chomp
  if hit == 'q'
    game_end = true
    game_over = true
      puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
      puts "              You lost              "
      puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
  elsif hit == 'bet'
    puts "how much do you want to bet?"

    while exit_bet == false
      bet = gets.chomp

      if bet == 'q'
        exit_bet = true
      elsif bet.to_i <= p1_score
        wager = bet.to_i
        exit_bet = true
      else
        puts "please enter an appropriate amount!"
      end
    end
  end

  if p1_one_card > p2_two_card
      p 'in p1 > p2'
    if wager > 0
      p1_score += wager
      p2_score -= wager
      wager = 0
      p 'in wager > 0'
    else
      p1_score += 1
      p 'in p1 score + 1'

    end
  else
    p 'in p1 < p2'
    if wager > 0
      p1_score -= wager
      p2_score += wager
      wager = 0
      p 'in wager > 0'
    else
      p2_score += 1
      p 'in p2 score +1'
    end
    puts 'wager is: ' + wager.to_s
  end

  exit_bet = false

  puts "| --------------------------------|"
  puts "#{name} card: " + p1_one_card.to_s
  puts "Opponent's card: " + p2_two_card.to_s
  puts "#{name} score: #{p1_score}, Opponent's score: #{p2_score}"
  puts "| --------------------------------|"
  puts "Type anything to continue [Type 'q' to quit game]"

  if p1_score == 5
    puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
    puts "              You won               "
    puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
    puts "           See you again!           "
    game_end = true
  elsif p2_score == 5
    puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
    puts "              You lost               "
    puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
    puts "           See you again!           "
    game_end = true
  end
end

# if game_over == true
#   puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
#   puts "              Game over              "
#   puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
# elsif p1_score == 5
#   puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
#   puts "              You won               "
#   puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
# else
#   puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
#   puts "              You lost              "
#   puts " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "
# end