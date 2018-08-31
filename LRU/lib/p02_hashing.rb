class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  # array of numbers
  # array of characters
  # symbols? 
  def hash
    self.each do |el|
      el.to_s(2)
    end
    end
  end
end

class String
  # string => array 
  # hash that array
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
