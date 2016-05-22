# -*- coding: utf-8 -*-

def b_method(a, b)
  yield(a, b)
end

plus  = b_method(3, 3) {|x,y| x+y }
times = b_method(3, 3) {|x,y| x*y }

p plus   # => 6
p times  # => 9

exit

def a_method
  if block_given?
    return yield
  else
    "ブロックがありません"
  end
end

p a_method # => ブロックがありません
p a_method { "ブロックがあるよ!" }
           # => ブロックがあるよ!
