text = File.read('speech.txt')

just_words = text.downcase.delete ".!,:?'"

# just_words2 = just_words1.delete

word_array   = just_words.split(" ")

word_sorted  = word_array.group_by{ |word| word }

ranked_words = word_sorted.sort_by{ |key, value| value.length }

top_five = ranked_words.last(5)

top_five.each_with_index[0..4]
