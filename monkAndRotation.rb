=begin
# Sample code to perform I/O:

name = gets.chomp                # Reading input from STDIN
print "Hi, #{name}.\n"           # Writing output to STDOUT

# Warning: Printing unwanted or ill-formatted data to output will cause the test cases to fail
=end

# Write your code here

no_of_tests = gets.chomp.to_i
no_of_tests.times do |index|
    arr = gets.chomp.split(" ")
    no_of_elements = arr[0].to_i
    step = arr[1].to_i

    input_array = gets.chomp.split(" ")

    step = step % no_of_elements

    if(step == 0)
      puts "#{input_array.join(" ")}"
    else
      puts "#{input_array[(no_of_elements - step)..(no_of_elements - 1)].join(" ")} #{input_array[0...(no_of_elements - step)].join(" ")}"
    end
end
