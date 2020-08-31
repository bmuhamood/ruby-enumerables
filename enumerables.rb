module Enumerable
  raise LocalJumpError if block_given? == false

  def my_each
    schools = ["Lugoba High", "Makerere Modern" "Kampala High", "Kisubu high"]
    schools.my_each { |school| puts "My School life  " + school}
  end

  def my_each_with_index
    schools = ["Lugoba High", "Makerere Modern" "Kampala High", "Kisubu high"]
    schools.my_each_with_index { |school, index| puts if school.index? [1]}
  end

  def my_select
    schools = ["Lugoba High", "Makerere Modern" "Kampala High", "Kisubu high"]
    schools.select { |school| school != "Kisubi high"} 
end

  def my_all
    words = %w[L M K H].all? { |words| word.lenght >= 3 }
    words = %w[L M K H].all? { |words| word.lenght >= 4 }
    words = %w[L M K H].all? { |words| word.lenght >= 3 }
  end

  def any
    animals = %w[ant bear cat].any? { |animal| animal.length >= 3 }
    animals = %w[ant bear cat].any? { |animal| animal.length >= 4 }
    animals = %w[ant bear cat].any?(/d/)
  end

  def my_none
    letters = %w[a b c d].none? { |letter| letter != t }
  end 

  def my_count
    ary = [1, 2, 4, 2]
    ary.count
    ary.count(2)
    ary.count{ |x| x%2==0 }
end

  def my_map
    my_balance [600, 500, 200, 400]
    my_balance.map { |balance| balance-400}
    puts balance
  end

  def my_inject
    (5..10).inject { |sum, n| sum + n }
  end

  def multiply_els
    my_arr = [2,4,5]
    my_arr.inject { |multpy, n| sum * n }
  end

  def my_map 
    burgers = {"Big Mac" => 300, "Whopper with cheese" => 450, "Wendy's Double with cheese" => 320}

    burgers.map
    => [["Wendy's Double with cheese", 320], ["Big Mac", 300], ["Whopper with cheese", 450]]
  end
end

