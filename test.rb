playerOneScore = 0
playerTwoScore = 0

put = 2.times.map{ Random.rand(52) }

puts put

if (put[0] >= put[1])
  playerOneScore += 1
  puts "Player One + 1"


  elsif (put[0] <= put[1])
    playerTwoScore += 1
    puts "Player Two + 1"

end

puts "SCORE: Player1 = #{playerOneScore}, player2 = #{playerTwoScore}"

