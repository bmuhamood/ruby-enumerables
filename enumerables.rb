module Enumerable
  def my_each(array)
    return to_enum unless block_given?

    i = 0
    n = to_a
    while i <= arr.length - 1
      yield (n[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    n = to_a
    while i <= n.length - 1
      yield(n[i], i)
      i += 1
    end
    self
  end

  def my_select
    n = []
    return to_enum(:my_select) unless block_given?

    self.my_each do |element|
      result = yield(element)
      n.push(element) if result
    end
    n
  end

  def my_all?(parameter = false)
    if block_given?

      for item in self
        return false unless yield(item)
      end
      return true
  end

  def my_any?
    if block_given? == true

  	  i = 0
  	  while i < self.length
  	    (yield self[i]) == true ? a = true : false
  	      if a == true
  	  	    return true
  	      end
  	    i += 1
  	      end
  	    false
    else 
  	  true
    end
  end

  def my_none?
    if block_given? == true

      i = 0
      while i < self.length
        (yield self[i]) == true ? a = true : false
          if a == true
            return false
          end
        i += 1
        end
        true
    else 
      if self.all? {|x| x == false}
        true
        else
      false
      end
    end
  end

  def my_count(parameter = false)
    result = 0
    if block_given? && parameter == false
      for item in self
        result += 1 if yield(item) == true
      end
      return result
    elsif !block_given? && parameter == false
      return self.length
    end

    if parameter
      for item in self
        result += 1 if item == parameter
      end
      return result
    end
  end

  def my_map(my_proc = false)
    n = []
    return to_enum(:my_map) unless block_given?

    for item in self
      if block_given? && my_proc == false
        n.push yield(item)
      elsif block_given? && my_proc.class == Proc
        n.push my_proc.call(item)
      elsif my_proc && my_proc.class == Symbol
        n.push item.my_proc
      elsif my_proc
        n.push my_proc.call(item)
      end
    end
    return n
  end

  def my_inject(sum=(set_var = true; self[0]))
    i = 0
    if set_var
      while i < (self.length - 1)
      sum = yield sum, self[i+1]
      i += 1
    end
  sum
  else
      while i < (self.length)
    sum = yield sum, self[i]
    i += 1
      end
    sum 
    end
  end
end 

def multiple_els(array)
  array.my_inject {|sum,x| sum * x}
end
