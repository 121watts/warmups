puts 0

1.upto(100) do |i|
  if i % 3 + i % 5 == 0
    puts "fizzbuzz"
  elsif i % 5 == 0
    puts "buzz"
  elsif i % 3 == 0
    puts "fizz"
  else
    puts i
  end
end
