no_of_tests = gets.chomp.to_i
no_of_tests.times do |index|
  n = gets.chomp.to_i
  matrix = []
  n.times do |_|
    matrix << gets.chomp.split(" ").collect(&:to_i)
  end

  count = 0
  n.times do |i|
    n.times do |j|
      (i...n).each do |p|
        (j...n).each do |q|
          if matrix[i][j] > matrix[p][q]
            count += 1
          end
        end
      end

    end
  end

  puts "#{count}"
end
