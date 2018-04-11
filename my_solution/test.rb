flag = true
count = 0
while flag
  puts "what is your name"
  name = gets

  puts "what do you like"
  like = gets

  if count > 2
    flag = false
  end
  count += 1
end  