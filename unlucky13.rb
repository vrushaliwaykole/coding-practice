=begin
The Unlucky 13
Write a program to calculate the total number of strings that are made of exactly N characters.
None of the strings can have "13" as a substring.
The strings may contain any integer from 0-9, repeated any number of times.

Input Format
First line: T, the number of test cases.
Next T lines: Each contain an integer N.

Output Format
Print the result of each query modulo 1000000009.
Answer for each test case should come in a new line.

=end


LIMIT = 1000000009
def modulo_for_10_power(n)
  if( n <= 9)
    10 ** n
  else
    res = modulo_for_10_power(n/2) % LIMIT
    (res * res) % LIMIT
  end
end

def string_containing_13(l)
  if l <= 1
    0
  elsif l == 2
    1
  else
    10 * string_containing_13(l - 1) % LIMIT + modulo_for_10_power(l - 2) - string_containing_13(l - 2) % LIMIT
  end
end


no_of_inputs = gets.chomp.to_i
no_of_inputs.times do |_|
    length = gets.chomp.to_i
    no_of_strings = modulo_for_10_power(length) - string_containing_13(length) % LIMIT
    puts "#{no_of_strings % 1000000009}"
end
