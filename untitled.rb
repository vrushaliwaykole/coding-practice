LIMIT = 1000000009
def modulo_for_10_power(n)
  if( n <= 9)
    10 ** n
  else
    res = modulo_for_10_power(n/2) % LIMIT
    (res * res) % LIMIT
  end
end

def string_containing_13 l, prev, prev_prev
  if l <= 1
    0
  elsif l == 2
    1
  else
    prev = 1
    prev_prev = 0
    (3..l).each do |index|
      tmp = prev
      prev = 10 * prev % LIMIT + modulo_for_10_power(index - 2) - prev_prev
      prev_prev = tmp
    end
    prev % LIMIT
  end
end


no_of_inputs = gets.chomp.to_i
no_of_inputs.times do |_|
    length = gets.chomp.to_i
    no_of_strings = modulo_for_10_power(length) - string_containing_13(length, nil, nil) % LIMIT
    puts "#{length}   #{no_of_strings % 1000000009}"
end
