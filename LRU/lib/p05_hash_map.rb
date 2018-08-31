require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    #hash the key
    #find index by hash 
    #search linked list at index for key
    #return true or false 
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    if @store[key.hash % num_buckets].include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else
      @store[key.hash % num_buckets].append(key, val)
      @count += 1
      
      if @count == num_buckets
        p @count
        resize!
      end
    end
  end

  def get(key)
    if include?(key)
      @store[key.hash % num_buckets].get(key)
    end
  end

  def delete(key)
    if include?(key)
      @store[key.hash % num_buckets].remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |linkedlist|
      linkedlist.each do |node|
        yield [node.key,node.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp_array = Array.new(num_buckets * 2) { LinkedList.new }
    @store.each do |linked_list|
      linked_list.each do |node|
        temp_array[node.key.hash % (num_buckets * 2)].append(node.key, node.val)
      end
    end
    @store = temp_array
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
