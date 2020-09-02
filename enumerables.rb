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
  new_arr = []
  return to_enum(:my_select) unless block_given?

  self.my_each do |element|
    result = yield(element)
    new_arr.push(element) if result
  end
  new_arr
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








def any
  return to_enum unless block_given?

    mynum1 = [10, 19, 18]    
    myres1 = mynum1.any? { |num| num>13}
    puts res1
    res2 = mynum1.any? { |num| num>=20}
    puts res2  
end

def my_none?
  return to_enum unless block_given?

  my_each do |item|
    return false if block_given? && yield(item) || !block_given? && item
  end
    true
  end                        
end 

def my_count
  return to_enum unless block_given?

    ary = [1, 2, 4, 2]
    ary.count
    ary.count(2)
    ary.count { |x| x%2==0 }
end

def my_inject
  return to_enum unless block_given?

  (5..10).inject { | sum, n| sum + n }
  end

def my_map
  return to_enum unless block_given?

    a = [18, 22, 33, 3, 5, 6]
    b = [1, 4, 1, 1, 88, 9]
    puts "map method : #{a.map {|num| num > 10 }}"
    puts "map method : #{b.map {|x| x.odd? }}"
  end
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
