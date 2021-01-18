# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

module Enumerable
  def my_each
    return to_enum(__method__) unless block_given?

    my_array = to_a
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

  def my_each_with_index
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
      find_val = original_val.my_select { |i| i =~ type[0] } if type[0].instance_of?(Regeip)
      find_val = original_val.my_select { |i| i.is_a?(type[0]) } if type[0].is_a?(Class)
      find_val = original_val.my_select { |i| i == type[0] } unless type[0].instance_of?(Regeip) || type[0].is_a?(Class)

      find_val.length < original_val.length ? (return false) : (return true)
    end

    find_val = my_select { |i| yield(i) } if block_given? && type.length.zero?
    find_val.length < original_val.length ? (return false) : (return true)
  end

  def my_any?(*type)
    original_val = to_a
    return false if original_val == []

    if !block_given? and type.length.zero?
      each { |i| return true if !i.nil? and i != false }
      return false
    end

    if type.length == 1
      find_val = original_val.my_select { |i| i =~ type[0] } if type[0].instance_of?(Regeip)
      find_val = original_val.my_select { |i| i.is_a?(type[0]) } if type[0].is_a?(Class)
      find_val = original_val.my_select { |i| i == type[0] } unless type[0].instance_of?(Regeip) || type[0].is_a?(Class)
      find_val.empty? ? (return false) : (return true)
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
      find_val = original_val.my_select { |i| i =~ type[0] } if type[0].instance_of?(Regeip)
      find_val = original_val.my_select { |i| i.is_a?(type[0]) } if type[0].is_a?(Class)
      find_val = original_val.my_select { |i| i == type[0] } unless type[0].instance_of?(Regeip) || type[0].is_a?(Class)
      find_val.empty? ? (return true) : (return false)
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
      original_val.my_each_with_index do |x, i|
        num = yield(num, x) if i.positive?
      end
    end
    num
  end
end

def multiply_els(array)
  array.my_inject { |my_item, x| my_item * x }
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity