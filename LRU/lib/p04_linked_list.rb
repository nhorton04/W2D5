class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

end

class LinkedList
  include Enumerable
  attr_reader :head_node, :tail_node
  
  def initialize
    @head_node = Node.new
    @tail_node = Node.new
    @head_node.next = @tail_node
    @tail_node.prev = @head_node
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head_node.next unless @head_node.next == @tail_node
    return nil
  end

  def last
    return @tail_node.prev unless @tail_node.prev == @head_node
    return nil
  end

  def empty?
    @head_node.next == @tail_node
  end

  def get(key)
    self.each do |node| 
      return node.val if node.key == key 
    end
  end

  def include?(key)
    current_node = @head_node
    until current_node == @tail_node
      current_node = current_node.next 
      if current_node.key == key
        return true
      end
    end
    return false
  end

  def append(key, val)
    #insert node
    #change node to point to end (next)
    #change node prev to point to whatever the end was pointing to
    #change end prev to point to new node
    #change whatever was pointing to end to point to the new node
    new_node = Node.new(key,val)
    
    new_node.next = @tail_node
    new_node.prev = @tail_node.prev
    
    @tail_node.prev.next = new_node
    @tail_node.prev = new_node
    # @head_node.next = new_node
    ##@linked_list[0...-1] + Node.new(key, val) + @linked_list[-1..-1]
  end

  def update(key, val)
    current_node = @head_node
    until current_node == @tail_node
      current_node = current_node.next 
      if current_node.key == key
        current_node.val = val
        break
      end
    end
  end

  def remove(key)
    current_node = @head_node
    until current_node == @tail_node
      current_node = current_node.next 
      if current_node.key == key
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
        break
      end
    end
  end

  def each
    current_node = @head_node
    until current_node == @tail_node
      current_node = current_node.next 
      yield current_node if current_node.next != nil      
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
  # 
  # def inspect
  #   "#Key: #{key}, Value: #{val}, Next: #{@next}, Previous: #{prev}"
  # end
end
