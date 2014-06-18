a = %w(a b c d e f g h)

puts a.shuffle(random: Random.new(1)).pop(7)
