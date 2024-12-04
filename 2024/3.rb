
sum = 0
File.open("3.txt", "r") do |f|
  do_sum = true
  f.each_line do |line|
    line.scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/) do |match|
      do_sum = true if match.first == "do()"
      do_sum = false if match.first == "don't()"

      next if match.first == "don't()" || match.first == "do()" 

      mult = match.first.gsub(/mul\((\d+,\d+)\)/, '\1').split(",").map(&:to_i)
      sum += mult.inject(:*) if do_sum
    end
  end
end

p sum
