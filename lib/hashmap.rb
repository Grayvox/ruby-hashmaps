# frozen_string_literal: true

# Defines the hashmap, which contains Linked lists, which contains nodes
class HashMap
  attr_accessor :capacity

  LOAD_FACTOR = 0.75

  def initialize(capacity = 16)
    @capacity = capacity
    @buckets = Array.new(capacity)
  end
end
