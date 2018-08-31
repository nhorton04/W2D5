class MaxIntSet
  attr_accessor :max, :store
  
  def initialize(max)
    @max = max + 1
    @store = Array.new(max, false)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num >= @max 
    raise "Out of bounds" if num < 0
  end

  def validate!(num)
    
  end
end


class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
   @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.include?(num)
      @store 
    else
      @store[num % num_buckets] << num
      @count += 1
      if @count == num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if self.include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end
  
   # ResizingIntSet.resize!
  
  private

  def [](num)
    # 4 buckets, 4 %, 0 1 2 3
    # 7 ---> 7 % 4 ----> 3, its in the 3rd bucket (index 4)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] # --> return array of store at a particular index
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_array = Array.new(num_buckets * 2) { Array.new }
    @store.each do |subarr|
      subarr.each do |num|
        temp_array[num % (num_buckets * 2)] << num
      end
    end
    @store = temp_array
  end
end
