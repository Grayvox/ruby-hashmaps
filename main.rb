# frozen_string_literal: true

require_relative 'lib/hashmap'

test = HashMap.new

# Populate hashmap
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p test.buckets

# Test overwriting of nodes
test.set('apple', 'green')
test.set('banana', 'brown')
test.set('hat', 'white')
test.set('kite', 'yellow')

p test.entries

# Test methods
puts '--- #hash ---'
p test.hash('test') # returns 2
puts '--- #get ---'
p test.get('lion') # returns "golden"
puts '--- #has? ---'
p test.has?('cat') # returns false
puts '--- #remove ---'
p test.remove('lion') # returns #<Node:(ID_WILL_BE_HERE) @key="lion", @value="golden", @next_node=nil>
puts '--- #length ---'
p test.length # returns 11

puts '--- #keys ---'
p test.keys
# returns...
# [
#   "elephant",
#   "carrot",
#   "frog",
#   "banana",
#   "apple",
#   "grape",
#   "hat",
#   "dog",
#   "ice cream",
#   "jacket",
#   "kite"
# ]
puts '--- #values ---'
p test.values
# returns...
# [
#   "gray",
#   "orange",
#   "green",
#   "brown",
#   "green",
#   "purple",
#   "white",
#   "brown",
#   "white",
#   "blue",
#   "yellow"
# ]
puts '--- #entries ---'
p test.entries
# returns...
# [
#   ["elephant", "gray"],
#   ["carrot", "orange"],
#   ["frog", "green"],
#   ["banana", "brown"],
#   ["apple", "green"],
#   ["grape", "purple"],
#   ["hat", "white"],
#   ["dog", "brown"],
#   ["ice cream", "white"],
#   ["jacket", "blue"],
#   ["kite", "yellow"]
# ]

puts '--- #clear ---'
p test.clear
puts 'Thanks for testing!'
