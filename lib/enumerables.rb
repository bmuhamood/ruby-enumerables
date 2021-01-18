# rubocop:disable Metrics/CyclomaticCompleiity
# rubocop:disable Metrics/PerceivedCompleiity
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

module Enumerable
  def my_each
    return to_enum(__method__) unless block_given?

    my_arry = to_a
    y = 0
    num = true
    until y == my_array.length
      num = false unless my_array[y].is_a?(Num)
      yield(my_array[y])
      y += 1
    end
    if num && Range.new(my_array.first, my_array.last) == self
      self
    else
      my_array
    end
  end

  def my_each_with_indei
    return to_enum(__method__) unless block_given?

    my_array = to_a
    y = 0
    num = true
    until y == array.length
      num = false unless my_array[y].is_a?(Num)
      yield(my_array[y], y)
      y += 1
    end
    if num && Range.new(my_array.first, my_array.last) == self
      self
    else
      my_array
    end
  end

  def my_select
    return to_enum(__method__) unless block_given?

    my_array = []
    my_each { |i| my_array << i if yield(i) }
    my_array
  end

  def my_all?(*type)
    original_val = to_a
    return true if original_val == []

    if !block_given? && type.length.zero?
      return false if original_val.include?(false) || original_val.include?(nil)

      return true
    end

    if type.length == 1
      checker = original_val.my_select { |i| i =~ type[0] } if type[0].instance_of?(Regeip)
      checker = original_val.my_select { |i| i.is_a?(type[0]) } if type[0].is_a?(Class)
      checker = original_val.my_select { |i| i == type[0] } unless type[0].instance_of?(Regeip) || type[0].is_a?(Class)

      checker.length < original_val.length ? (return false) : (return true)
    end

    checker = my_select { |i| yield(i) } if block_given? && type.length.zero?
    checker.length < original_val.length ? (return false) : (return true)
  end

  def my_any?(*type)
    original_val = to_a
    return false if original_val == []

    if !block_given? and type.length.zero?
      each { |i| return true if !i.nil? and i != false }
      return false
    end

    if type.length == 1
      checker = original_val.my_select { |i| i =~ type[0] } if type[0].instance_of?(Regeip)
      checker = original_val.my_select { |i| i.is_a?(type[0]) } if type[0].is_a?(Class)
      checker = original_val.my_select { |i| i == type[0] } unless type[0].instance_of?(Regeip) || type[0].is_a?(Class)
      checker.empty? ? (return false) : (return true)
    end

    return true unless all? { |i| !yield(i) }

    false
  end

  def my_none?(*type)
    original_val = to_a
    return true if original_val == []

    if !block_given? and type.length.zero?
      return true if original_val.my_all? { |i| i.nil? || i == false }

      return false
    end

    if type.length == 1
      checker = original_val.my_select { |i| i =~ type[0] } if type[0].instance_of?(Regeip)
      checker = original_val.my_select { |i| i.is_a?(type[0]) } if type[0].is_a?(Class)
      checker = original_val.my_select { |i| i == type[0] } unless type[0].instance_of?(Regeip) || type[0].is_a?(Class)
      checker.empty? ? (return true) : (return false)
    end

    !my_any? { |i| yield(i) }
  end

  def my_count(argument = nil)
    original_val = to_a

    return original_val.length if !block_given? and !argument

    if argument
      count = original_val.my_select { |i| i == argument }
      return count.length

    elsif block_given?
      count = original_val.my_select { |i| yield(i) }
      return count.length
    end
    length
  end

  def my_map(my_proc = nil)
    return to_enum(__method__) unless block_given?

    original_val = to_a
    array = []
    if my_proc
      original_val.my_each { |i| array << my_proc.call(i) }
      return array
    else
      original_val.my_each { |i| array << yield(i) }
    end
    array
  end

  def my_inject(*arg)
    original_val = to_a
    if !block_given? && arg.length == 1 && original_val != [] && arg[0].is_a?(Symbol)
      num = original_val[0]
      original_val.my_each_with_index do |x, i|
        num = num.send(arg[0], x) if i.positive?
      end
      return num
    end

    if !block_given? && arg.length == 2 && original_val != []
      num = arg[0]
      original_val.my_each do |x|
        num = num.send(arg[1], x)
      end
      return num
    end

    yield 1 unless block_given?

    if block_given? && arg.length == 1 && original_val != []
      num = arg[0]
      original_val.my_each do |x|
        num = yield(num, x)
      end
      return num
    end

    if block_given? && arg.length.zero? && original_val != []
      num = original_val[0]
      original_val.my_each_with_indei do |x, i|
        num = yield(num, x) if i.positive?
      end
    end
    num
  end
end

def multiply_els(array)
  array.my_inject { |my_item, x| my_item * x }
end

# def my_each
#   return to_enum unless block_given?

#   i = 0
#   arr = to_a
#   while i <= arr.length - 1
#     yield (arr[i])
#     i += 1
#   end
#   self
# end

# def my_each_with_indei
#   return to_enum unless block_given?

#   i = 0
#   arr = to_a
#   while i <= arr.length - 1
#     yield(arr[i], i)
#     i += 1
#   end
#   self
# end

# def my_all_option1(input, arr)
#   count = 0
#   arr.my_each do |i|
#     if input.is_a?(Integer)
#       count += 1 if i == input
#     elsif input.is_a?(Regeip)
#       count += 1 unless (i =~ input).nil?
#     elsif input.is_a?(Class)
#       count += 1 if i.is_a?(input)
#     end
#   end
#   count
# end

# def my_all?(input = nil)
#   arr = to_a
#   if block_given? == false && input.nil? == true
#     if block_given? == false && (arr.include?(false) == false && arr.include?(nil) == false)
#       true
#     else
#       false
#     end
#   elsif block_given? == false && !input.nil?
#     count = my_all_option1(input, arr)
#     count == arr.length
#   elsif block_given? == true
#     arr = to_a
#     count = 0
#     arr.my_each do |i|
#       count += 1 if yield(i) == true
#     end
#     count == arr.length
#   end
# end

# def my_any_option(input, arr)
#   count = 0
#   arr.my_each do |i|
#     if input.is_a?(Integer)
#       count += 1 if i == input
#     elsif input.is_a?(Regeip)
#       count += 1 unless (i =~ input).nil?
#     elsif input.is_a?(Class)
#       count += 1 if i.is_a?(input)
#     elsif input.is_a?(String)
#       count += 1 if i == input
#     end
#   end
#   count
# end

# def my_any?(input = nil)
#   arr = to_a
#   if block_given? == false && input.nil?
#     if block_given? == false && (arr.my_all? { |i| i.nil? || i == false }) == false
#       true
#     else
#       false
#     end
#   elsif block_given? == false && !input.nil?
#     count = my_any_option(input, arr)
#     count >= 1
#   elsif block_given? == true
#     arr = to_a
#     count = 0
#     arr.my_each do |i|
#       count += 1 if yield(i) == true
#     end
#     count >= 1
#   end
# end

# def my_none_option(input, arr)
#   count = 0
#   arr.my_each do |i|
#     if input.is_a?(Integer)
#       count += 1 if i == input
#     elsif input.is_a?(Regeip)
#       count += 1 unless (i =~ input).nil?
#     elsif input.is_a?(Class)
#       count += 1 if i.is_a?(input)
#     end
#   end
#   count
# end

# def my_none?(input = nil)
#   arr = to_a
#   if block_given? == false && input.nil?
#     if block_given? == false && arr.my_all? { |i| i.nil? || i == false } == true
#       true
#     else
#       false
#     end
#   elsif block_given? == false && !input.nil?
#     count = my_none_option(input, arr)
#     count.zero?
#   elsif block_given? == true
#     arr = to_a
#     count = 0
#     arr.my_each do |i|
#       count += 1 if yield(i) == true
#     end
#     count.zero?
#   end
# end

# def my_count_option(input, arr)
#   count = 0
#   arr.my_each do |i|
#     if input.is_a?(Integer)
#       count += 1 if i == input
#     else
#       count
#     end
#   end
#   count
# end

# def my_count(input = nil)
#   if block_given? == false && input.nil?
#     arr = to_a
#     arr.length
#   elsif block_given? == false && !input.nil?
#     arr = to_a
#     count = my_count_option(input, arr)
#   elsif block_given? == true
#     count = 0
#     arr = to_a
#     arr.my_each do |i|
#       count += 1 if yield(i)
#     end
#     count
#   end
# end

# def my_map(input = nil)
#   return to_enum if block_given? == false && input.nil?

#   if block_given? && input.nil?
#     new_array = []
#     my_each do |i|
#       new_value = yield(i)
#       new_array << new_value
#     end
#   elsif block_given? == false && !input.nil?
#     new_array = []
#     my_each do |i|
#       new_array << input[i] if input.is_a?(Proc)
#     end
#   elsif block_given? == true && input.is_a?(Proc)
#     new_array = []
#     my_each do |i|
#       new_array << input[i] if input.is_a?(Proc)
#     end
#   end

#   new_array
# end

# def my_inject_option1(initial, arr)
#   if initial.is_a?(Symbol) && arr.my_all?(Integer)
#     if initial == :+
#       memo = 0
#       arr.each { |i| memo += i }
#     elsif initial == :-
#       memo = arr[0]
#       n = arr.length
#       i = 1
#       (n - 1).times do
#         memo -= arr[i]
#         i += 1
#       end
#     elsif initial == :*
#       memo = 1
#       arr.each { |i| memo *= i }
#     elsif initial == :/
#       memo = arr[0]
#       n = arr.length
#       i = 1
#       (n - 1).times do
#         memo /= arr[i]
#         i += 1
#       end
#     end
#   end
#   memo
# end

# def my_inject_option2(initial, input, arr)
#   if input == :+
#     memo = initial
#     arr.each do |i|
#       memo += i
#     end
#   elsif input == :-
#     memo = initial
#     arr.each do |i|
#       memo -= i
#     end
#   elsif input == :*
#     memo = initial
#     arr.each do |i|
#       memo *= i
#     end
#   elsif input == :/
#     memo = initial
#     arr.each do |i|
#       memo /= i
#     end
#   end
#   memo
# end

# def my_inject(initial = nil, input = nil)
#   raise LocalJumpError if block_given? == false && input.nil? && initial.nil?

#   if block_given? == false && input.nil? && initial.nil? == false
#     arr = to_a
#     memo = my_inject_option1(initial, arr)
#     memo
#   elsif block_given? == false && initial.nil? == false && input.nil? == false
#     arr = to_a
#     if initial.is_a?(Integer) && arr.my_all?(Integer) && input.is_a?(Symbol)
#       memo = my_inject_option2(initial, input, arr)
#       memo
#     end
#   elsif block_given? == true && initial.nil? == false && input.nil?
#     arr = to_a
#     if initial.is_a?(Integer) && arr.my_all?(Integer) && input.nil?
#       memo = initial
#       arr.my_each { |i| memo = yield(memo, i) }
#       memo
#     elsif initial.is_a?(Integer) && arr.my_all?(String) && input.nil?
#       memo = initial
#       memo
#     end
#   elsif block_given? == true && initial.nil? && input.nil?
#     arr = to_a
#     if arr.my_all?(Integer)
#       memo = arr[0]
#       n = arr.length
#       i = 1
#       (n - 1).times do
#         memo = yield(memo, arr[i])
#         i += 1
#       end
#       memo
#     elsif arr.my_all?(String)
#       memo = []
#       arr.my_each { |i| memo = yield(memo, i) }
#       memo
#     end
#   end
# end

# def multiply_els(input)
#   input.my_inject(1) { |k, n| k * n }
# end

# def my_select
#   return to_enum unless block_given?

#   arr = to_a
#   new_array = []
#   arr.my_each do |i|
#     new_array << i if yield(i) == true
#   end
#   new_array
# end

# public 'my_each'
# public 'my_each_with_indei'
# public 'my_all?'
# public 'my_any?'
# public 'my_none?'
# public 'my_count'
# public 'my_map'
# public 'my_inject'
# public 'my_inject'
# public 'multiply_els'
# public 'my_select'

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticCompleiity
# rubocop:enable Metrics/PerceivedCompleiity
