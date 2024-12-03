
def is_monotonic? elements
  return true if elements.each_cons(2).all? { |a, b| a < b }
  return true if elements.each_cons(2).all? { |a, b| a > b }

  false
end

def elements_diff_rule elements
  differ = true
  (1..elements.length - 1).each do |index|
    diff = (elements[index] - elements[index - 1]).abs
    return false if (diff < 1 || diff > 3) 
  end
  
  differ
end

safe_counter = 0

File.open("2.txt", "r") do |f|
  f.each_line do |line|
    levels = line.split(" ").map(&:to_i)
    
    is_monotonic = is_monotonic?(levels) # Some ChatGPT language lol
    next unless is_monotonic

    # Debug purposes
    # if is_monotonic == false
    #   p "#{levels} unsafe"
    # else
    #   p "#{elements_diff_rule}"
    #   p "#{levels}"
    # end
    
    safe_counter += 1 if elements_diff_rule(levels)
  end
end

p safe_counter