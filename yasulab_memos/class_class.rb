# -*- coding: utf-8 -*-

def add_hi
  define_method :hi do
    puts "hi!"
  end
end

class A         ; add_hi; end
B = Class.new do; add_hi; end

A.new.hi  # => hi!
B.new.hi  # => hi!
