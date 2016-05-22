# -*- coding: utf-8 -*-


l = ->       { puts "hi" }
p = Proc.new { puts "hi" }

l.call  # => hi
p.call  # => hi



def my_method
  "メソッドを定義したよ!"
end

puts my_method
# => メソッドを定義したよ!
