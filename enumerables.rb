# rubocop:disable Style/For

# rubocop:disable Style/RedundantSelf

# rubocop:disable Metrics/CyclomaticComplexity

# rubocop:disable Metrics/MethodLength

# rubocop:disable Metrics/PerceivedComplexity

# rubocop:disable Style/GuardClause

# rubocop:disable Style/MultipleComparison

# rubocop:disable Style/IdenticalConditionalBranches

# rubocop:disable Style/NilComparison

# rubocop:disable Metrics/ModuleLength

# rubocop:disable Style/RedundantReturn

# rubocop:disable Style/IfUnlessModifier

def my_each(array)
    raise LocalJumpError if block_given? == false

      i=0 
      while i < array.length 
        yield(array[i])
        i += 1 
      end 
      array 
    end

  def my_each_with_index
    raise LocalJumpError if block_given? == false
 
    a = ["abc", "nil", "dog"]
    b = ["hello", "hi", "dog"]
    puts "each_index : #{b.each_index{|x| x = 2}}\n\n"

  def my_select
    raise LocalJumpError if block_given? == false

    num_array = [1, 2, 3, 4, 5]

    def my_select(array)
      i = 0
      select = []
      while i < array.length
        if yield(array[i])
          select << array[i]
        end
        i+=1
      end
      select
    end
    
    my_select(num_array) { | num | num.even? }
end

  def my_all
    raise LocalJumpError if block_given? == false
    
    class my_arr
      def initialize(array)
        @array = array
      end
    def my_all?
      @array.each do |element|
        return true unless block_given?
        true_false = yield(element)
        return false unless true_false
      end
      return true 
    end
  end

  a = my_arr.new([1,2,3])
  p a.my_all? { |x| x > 0 }
  p a.my_all? { |x| x > 1 }

  def any
    raise LocalJumpError if block_given? == false

    mynum1 = [10, 19, 18]    
    myres1 = mynum1.any? { |num| num>13}
    puts res1
    res2 = mynum1.any? { |num| num>=20}
    puts res2  
  end

  def my_none?
    raise LocalJumpError if block_given? == false

    my_each do |item|
      return false if block_given? && yield(item) || !block_given? && item
    end
      true
    end                        
  end 

  def my_count
    raise LocalJumpError if block_given? == false

    ary = [1, 2, 4, 2]
    ary.count
    ary.count(2)
    ary.count { |x| x%2==0 }
end

  def my_inject
    raise LocalJumpError if block_given? == false

    (5..10).inject { | sum, n| sum + n }
  end

  def multiply_els
    raise LocalJumpError if block_given? == false

    my_arr.inject { | multiply, n| sum * n }
  end

  def my_map
    raise LocalJumpError if block_given? == false

    a = [18, 22, 33, 3, 5, 6]
    b = [1, 4, 1, 1, 88, 9]
    c = [18, 22, 3, 3, 50, 6]
    puts "map method : #{a.map {|num| num > 10 }}\n\n"
    puts "map method : #{b.map {|x| x.odd? }}\n\n"
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

# rubocop:enable Style/For

# rubocop:enable Style/RedundantSelf

# rubocop:enable Metrics/CyclomaticComplexity

# rubocop:enable Metrics/MethodLength

# rubocop:enable Metrics/PerceivedComplexity

# rubocop:enable Style/GuardClause

# rubocop:enable Style/MultipleComparison

# rubocop:enable Style/IdenticalConditionalBranches

# rubocop:enable Style/NilComparison

# rubocop:enable Metrics/ModuleLength

# rubocop:enable Style/RedundantReturn

# rubocop:enable Style/IfUnlessModifier