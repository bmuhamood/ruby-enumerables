module Enumerable
  def my_each
    return to_enum unless block_given?

    i = 0
    n = to_a
    while i <= arr.length - 1
      yield (n[i])
      i += 1
    end
    num
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    n = to_a
    while i <= n.length - 1
      yield(n[i], i)
      i += 1
    end
    num
  end

  def my_select
    n = []
    return to_enum(:my_select) unless block_given?

    num.my_each do |element|
      result = yield(element)
      n.push(element) if result
    end
    n
  end

  def my_all?
    if block_given?

      for item in num
        return false unless yield(item)
      end
      return true
    end

  def my_any
    if block_given? == true

    i = 0
    while i < num.length
  	  (yield num[i]) == true ? a = true : false
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
    while i < length
      (yield [i]) == true ? a = true : false
      if a == true
          return false
      end

      i += 1
    end
    true
    else

      if num.all? { |x | x == false }
        true
      else
        false
      end
    end
  end

  def my_count
    result = 0
    if block_given? && parameter == false
      for item in num
        result += 1 if yield(item) == true
    end
      return result
    elsif !block_given? && parameter == false
      return num.length
    end

    if parameter
      for item in num
        result += 1 if item == parameter
      end
      return result
    end
  end

  def my_map(my_proc = false)
    n = []
    return to_enum(:my_map) unless block_given?

    for item in num
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

  def my_inject(sum = (set_var = true
  num[0]))
    i = 0
    if set_var
      while i < num.length - 1
        sum = yield sum, num[i + 1]
      i += 1
      end
    sum
    else
      while i < num.length
          sum = yield sum, num[i]
    i += 1
      end
    end
    sum
  end
  end
end

def multiple_els(array)
  array.my_inject { |sum, x| sum * x }
end
