# frozen_string_literal: true

require_relative 'hash-utils/linked_list'

# Defines the hashmap, which contains Linked lists, which contains nodes
class HashMap
  attr_accessor :capacity, :buckets

  def initialize(capacity = 16)
    @capacity = capacity
    @buckets = Array.new(capacity)
  end

  def hash(key)
    hash_code = 0
    key.each_char { |char| hash_code = 31 * hash_code + char.ord }
    hash_code % capacity
  end

  def set(key, value)
    code = hash(key)
    bucket = @buckets[code]
    return @buckets[code].append(key, value) unless bucket.nil? || bucket.contains?(key)

    @buckets[code] = LinkedList.new
    @buckets[code].append(key, value)
  end
end
