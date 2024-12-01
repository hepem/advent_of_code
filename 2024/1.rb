diff_sum = []
left_list = []
right_list = []

File.open("1.txt", "r") do |f|
  f.each_line do |line|
    splited_line = line.split(" ")
    left_list << splited_line[0].to_i
    right_list << splited_line[1].to_i
  end
end

left_list.sort!
right_list.sort!

0.upto(left_list.length - 1) do |i|
  diff_sum << (left_list[i] - right_list[i]).abs
end

p diff_sum.sum
