# The submarine seems to already have a planned course (your puzzle input).
# You should probably figure out where it's going. For example:

# forward 5
# down 5
# forward 8
# up 3
# down 8
# forward 2
# Your horizontal position and depth both start at 0.
# The steps above would then modify them as follows:

# forward 5 adds 5 to your horizontal position, a total of 5.
# down 5 adds 5 to your depth, resulting in a value of 5.
# forward 8 adds 8 to your horizontal position, a total of 13.
# up 3 decreases your depth by 3, resulting in a value of 2.
# down 8 adds 8 to your depth, resulting in a value of 10.
# forward 2 adds 2 to your horizontal position, a total of 15.
# After following these instructions, you would have a horizontal
# position of 15 and a depth of 10. (Multiplying these together produces 150.)

# Calculate the horizontal position and depth you would have after
# following the planned course. What do you get if you multiply your final
# horizontal position by your final depth?

def regex
  /(\w+)\s(\d+)/
end

def format_input(input)
  input.map { |command| command.scan(regex).flatten }
end

prac_input = [
  'forward 5',
  'down 5',
  'forward 8',
  'up 3',
  'down 8',
  'forward 2'
]

prac_input = format_input(prac_input)

puzzle_input = format_input(File.read('input_day2.txt').split("\n"))

def directions(command, locations)
  movements = {
    'forward' => -> { locations[:distance] += command.last.to_i },
    'down' => -> { locations[:depth] += command.last.to_i },
    'up' => -> { locations[:depth] -= command.last.to_i }
  }
  movements[command.first].call
  locations
end

def part1(input)
  locations = { depth: 0, distance: 0 }
  input.reduce(locations) do |acc, command|
    directions(command, acc)
  end

  locations.values.reduce(&:*)
end

puts '--- Part 1 ---'
puts "Practice: #{part1(prac_input)}"
puts "Result: #{part1(puzzle_input)}"

# --- Part Two ---
# Based on your calculations, the planned course doesn't seem to make any sense.
# You find the submarine manual and discover that the process is actually slightly more complicated.

# In addition to horizontal position and depth, you'll also need to track a third
# value, aim, which also starts at 0. The commands also mean something entirely different than you first thought:

# down X increases your aim by X units.
# up X decreases your aim by X units.
# forward X does two things:
# It increases your horizontal position by X units.
# It increases your depth by your aim multiplied by X.
# Again note that since you're on a submarine, down and up do the opposite of
# what you might expect: "down" means aiming in the positive direction.

# Now, the above example does something different:

# forward 5 adds 5 to your horizontal position, a total of 5. Because your aim is 0,
# your depth does not change.
# down 5 adds 5 to your aim, resulting in a value of 5.
# forward 8 adds 8 to your horizontal position, a total of 13. Because your aim is 5,
# your depth increases by 8*5=40.
# up 3 decreases your aim by 3, resulting in a value of 2.
# down 8 adds 8 to your aim, resulting in a value of 10.
# forward 2 adds 2 to your horizontal position, a total of 15. Because your aim
# is 10, your depth increases by 2*10=20 to a total of 60.
# After following these new instructions, you would have a horizontal position of
# 15 and a depth of 60. (Multiplying these produces 900.)

# Using this new interpretation of the commands, calculate the horizontal position
# and depth you would have after following the planned course. What do you get if
# you multiply your final horizontal position by your final depth?

def movement(command, location)
  deltas = {
    'forward' => -> {
      location[:distance] += command.last.to_i
      location[:depth] += command.last.to_i * location[:aim]
    },
    'up' => -> {
      location[:aim] -= command.last.to_i
    },
    'down' => -> {
      location[:aim] += command.last.to_i
    }
  }
  deltas[command.first].call
end

def part2(input)
  location = { depth: 0, aim: 0, distance: 0 }
  input.each do |command|
    movement(command, location)
  end

  location[:depth] * location[:distance]
end

puts '--- Part 2 ---'
puts "Practice: #{part2(prac_input)}"
puts "Result: #{part2(puzzle_input)}"
