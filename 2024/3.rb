
sum = 0
File.open("3.txt", "r") do |f|
  f.each_line do |line|
    line.scan(/mul\(\d+,\d+\)/) do |match|
      mult = match.gsub(/mul\((\d+,\d+)\)/, '\1').split(",").map(&:to_i)
      sum += mult.inject(:*)
    end
  end
end

p sum