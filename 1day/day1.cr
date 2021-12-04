# --- Day 1: Sonar Sweep ---

input = File.read("input_day1.txt").split("\n")
input.pop
prac_input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

# For example, suppose you had the following report:

# 199
# 200
# 208
# 210
# 200
# 207
# 240
# 269
# 260
# 263

# In the example above, the changes are as follows:

# 199 (N/A - no previous measurement)
# 200 (increased)
# 208 (increased)
# 210 (increased)
# 200 (decreased)
# 207 (increased)
# 240 (increased)
# 269 (increased)
# 260 (decreased)
# 263 (increased)

# In this example, there are 7 measurements that are larger than
# the previous measurement.

def part1(input)
  input[1..].each_with_index.count do |num, i|
    num.to_i > input[i].to_i
  end
end

puts "--- Part 1 ---"
puts "Practice: #{part1(prac_input)}"
puts "Solution: #{part1(input)}"

# PART 2
# Instead, consider sums of a three-measurement sliding window.
# Again considering the above example:

# 199  A
# 200  A B
# 208  A B C
# 210    B C D
# 200  E   C D
# 207  E F   D
# 240  E F G
# 269    F G H
# 260      G H
# 263        H

# In the above example, the sum of each three-measurement window is as follows:

# A: 607 (N/A - no previous sum)
# B: 618 (increased)
# C: 618 (no change)
# D: 617 (decreased)
# E: 647 (increased)
# F: 716 (increased)
# G: 769 (increased)
# H: 792 (increased)

# In this example, there are 5 sums that are larger than the previous sum.

# Consider sums of a three-measurement sliding window.
# How many sums are larger than the previous sum?

def part2(input)
end

puts "--- Part 2 ---"
puts "Practice: #{part2(prac_input)}"
puts "Solution: #{part2(input)}"
