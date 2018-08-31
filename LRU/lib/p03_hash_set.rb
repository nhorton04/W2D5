class HashSet
  attr_reader :count
  attr_accessor :store
  
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1 unless include?(key)
    @store[(key.hash % num_buckets)] << key unless include?(key)
    if @count == num_buckets
      resize!
    end
  end
    
  def include?(key)
    @store[(key.hash % num_buckets)].include?(key)
  end

  def remove(key)
    if include?(key)
      @store[(key.hash % num_buckets)].delete(key)
      @count -= 1 
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_array = Array.new(num_buckets * 2) { Array.new }
    @store.each do |subarr|
      subarr.each do |num|
        temp_array[num.hash % (num_buckets * 2)] << num
      end
    end
    @store = temp_array
  end
end
