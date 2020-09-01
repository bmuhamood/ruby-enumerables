module Enumerable

  def my_each
    raise LocalJumpError if block_given? == false

    schools = ["Lugoba High", "Makerere Modern" "Kampala High", "Kisubu high"]
    schools.my_each { | school| puts "My School life  " + school }
    puts school
  end

  def my_each_with_index
    raise LocalJumpError if block_given? == false

    schools = ["Lugoba High", "Makerere Modern" "Kampala High", "Kisubu high"]
    schools.my_each_with_index { | school, index| puts if school.index? [1] }
  end

  def my_select
    raise LocalJumpError if block_given? == false

    schools = ["Lugoba High", "Makerere Modern" "Kampala High", "Kisubu high"]
    schools.select { | school| school != "Kisubi high" } 
    (1..10).find_all { |i|  i % 3 == 0 }
    [1,2,3,4,5].select { |num|  num.even?  }
end

  def my_all
    raise LocalJumpError if block_given? == false

    pets = %w[dog bear cat].all? { |word| word.length >= 3 }
    pets = %w[dog bear cat].all? { |word| word.length >= 4 }
    pets = %w[dog bear cat].all?(/t/)                       
    [1, 2i, 3.14].all?(Numeric)
    [nil, true, 99].all?                             
    [].all?
  end

  def any
    raise LocalJumpError if block_given? == false

    animals = %w[dog bear cat].any? { |word| word.length >= 3 }
    animals = %w[dog bear cat].any? { |word| word.length >= 4 }
    animals = %w[dog bear cat].any?(/d/)
    [nil, true, 99].any?(Integer)
    [nil, true, 99].any?                            
    [].any? 
  end

  def my_none
    raise LocalJumpError if block_given? == false

    letters = %w[a b c d].none? { | letter| letter != t }
    animals = %w{ant bear cat}.none? { |word| word.length == 5 }
    animals =  %w{ant bear cat}.none? { |word| word.length >= 4 }
    animals = %w{ant bear cat}.none?(/d/)
    num = [1, 3.14, 42].none?(Float)                        
    num = [].none?                                         
    num = [nil].none?                                       
    num = [nil, false].none?                                
    num = [nil, false, true].none?                          
  end 

  def my_count
    raise LocalJumpError if block_given? == false

    ary = [1, 2, 4, 2]
    ary.count
    ary.count(2)
    ary.count{ |x| x%2==0 }
end

  def my_map
    raise LocalJumpError if block_given? == false

    my_balance [600, 500, 200, 400]
    my_balance.map { | balance| balance-400 }
    puts balance
  end

  def my_inject
    raise LocalJumpError if block_given? == false

    (5..10).inject { | sum, n| sum + n }
  end

  def multiply_els
    raise LocalJumpError if block_given? == false

    my_arr = [2,4,5]
    my_arr.inject { | multiply, n| sum * n }
  end

  def my_map
    raise LocalJumpError if block_given? == false

    burgers = {"Big Mac" => 300, "Whopper with cheese" => 450, "Wendy's Double with cheese" => 320}
    burgers.map => [["Wendy's Double with cheese", 320], ["Big Mac", 300], ["Whopper with cheese", 450]]
  end
end
