# -*- coding: utf-8 -*-

define_method :my_method do
  "メソッドを使ってメソッドを定義した!"
end

puts my_method
# => メソッドを使ってメソッドを定義した!

class String
  3.times { |i|
    define_method "foo_#{i}" do
      puts i
    end
  }
end

"".foo_0  # => 0
"".foo_1  # => 1
"".foo_2  # => 2
#"".foo_3  # => NoMethodError





