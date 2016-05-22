

def double(callable_obj)
  callable_obj.call * 2
end

l  =       -> { return 10 }
p1 = Proc.new { return 10 }
p2 = Proc.new { 10 }

puts double l  # => 20
puts double p1 # => LocalJumpError
puts double p2 # => 20

