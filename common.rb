paragraph = %Q{Breakfast procuring nay end happiness allowance assurance
  frankness. Met simplicity nor difficulty unreserved who. Entreaties mr
  conviction dissimilar me astonished estimating cultivated. On no applauded
  exquisite my additions. Pronounce add boy estimable nay suspected. You sudden
  nay elinor thirty esteem temper. Quiet leave shy you gay off asked large style.
  }

array = paragraph.split("")

sorted = array.group_by{|i| i = i.downcase}

parsed = sorted.delete_if{|key,value| key == " "}

count_sort = parsed.sort_by{|key, value| value.length}.pop(5)

puts count_sort.
