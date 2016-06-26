# -*- coding: utf-8 -*-

# 課題: 3.rubython

# ブロックとは、クロージャである

def my_method
  x = "Goodbye"
  yield "無慈悲な世界へ"
end

x = "Hello"
my_method {|y| "#{x}, #{y}" } # => "Hello, ...?"

# ブロック内での束縛は、ブロック外では消える

def just_yield
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
  local_to_block = 1
end

top_level_variable # => 2

# local_to_block はスコープの外にある
# (REPLを再起動する)

# スコープゲートについて

local_variables

v1 = 1

class MyClass
  v2 = 2
  p local_variables

  def my_method
    v3 = 3
    p local_variables
  end

  p local_variables
end

obj = MyClass.new
obj.my_method
local_variables # => [:obj, :v1, :top_level_variable, :x, :_]

# [3つのスコープゲート: クラス定義、モジュール定義、メソッド定義]

# 課題: 3.scope_gates

# instance_eval メソッド

class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  p self
  p @v
end

v = 2
obj.instance_eval { @v = v }
obj.instance_eval { @v } # => 2

# Proc オブジェクト
# (REPLを再起動する)

inc = Proc.new {|x| x + 1 }
inc.call(2) # => 3

# Lambda メソッド

dec = lambda {|x| x - 1 }
dec.class   # => Proc
dec.call(2) # => 1

p = ->(x) { x + 1 }
p.call(2) # => 1

# & オペレーター
# (REPLを再起動する)

def my_method1(&the_proc)
  the_proc
end

p = my_method1 {|name| "Hello, #{name}!" }
p.class         # => Proc
p.call("Bill")  # => "Hello, Bill!"

def my_method2(greeting)
  "#{greeting}, #{yield}!"
end

my_proc = proc { "Bill" }
my_method2("Hello", &my_proc)

# 課題: 3.buffer
