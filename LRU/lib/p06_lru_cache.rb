require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    #you see Key
    #is your key already in the cache?
    #   yes? ---> update key to be most recently seen
    # => no? ---> check to see if cache is full
    # => yes? ---> remove least recently seen item, append key
    # => no? ----> append key
    # update map?
    if @map.include?(key)
      # update node to be most recently used
      #(Do not compute proc)
      #update_node!(
    else
      # call proc using the key as input (this will get our value)
      # add value to cache
      # check cache size, if exceeded, eject! LRU object
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    @store.remove(last.key)
  end
end
