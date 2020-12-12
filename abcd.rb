original_array = [3,-2,4,19,4, -123, 22, 99, 34,55,2]

original_array.sort!

multiplication_of_neg_nos = []

# multiply negative numbers in pair of two to get positive number
original_array.each_slice(2) do |num1, num2|
  if(num1 < 0 && num2 < 0)
    multiplication_of_neg_nos << num1 * num2
  end
end


# create second array of only positive numbers
positive_numbers = original_array.select{|elem| elem >= 0}
positive_numbers.reverse!

index_mul_neg_no = 0
index_pos_no = 0
no_of_integers_to_multiply = 5
multiplication = 1

while no_of_integers_to_multiply > 0
  if index_pos_no >= positive_numbers.length

    multiplication *= multiplication_of_neg_nos[index_mul_neg_no]

    index_mul_neg_no += 1
    no_of_integers_to_multiply -= 2

  elsif index_mul_neg_no >= multiplication_of_neg_nos.length

    multiplication *= positive_numbers[index_pos_no]

    index_pos_no += 1
    no_of_integers_to_multiply -= 1

  elsif multiplication_of_neg_nos[index_mul_neg_no] > positive_numbers[index_pos_no]

    multiplication *= multiplication_of_neg_nos[index_mul_neg_no]

    index_mul_neg_no += 1
    no_of_integers_to_multiply -= 2

  else

    multiplication *= positive_numbers[index_pos_no]

    index_pos_no += 1
    no_of_integers_to_multiply -= 1

  end

end

puts "multiplication:  #{multiplication}"
puts "answer should be: 77384340"
