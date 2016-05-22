# -*- coding: utf-8 -*-

class C
  def x
    1
  end
end

obj = C.new
obj.x

# クラス定義も、ただのコードである

class C
  puts "hello"
end

3.times do
  class MyClass
    puts "hello"
  end
end

# すべて同じクラスで、違うクラスではない

class D
  def x; 'x'; end
end

class D
  def y; 'y'; end
end

obj = D.new
obj.x # => "x"
obj.y # => "y"

# オープンクラス

class String
  def shout
    upcase + "!"
  end
end

"hello".class # => String
"hello".shout # => "HELLO!"

# クラスとオブジェクト

class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
obj.class # => MyClass

# [板書: クラスとオブジェクトの関係図]

# インスタンス変数はどこにある?

obj.instance_variables # => []
obj.my_method
obj.instance_variables # => [:@v]

# [板書: インスタンス変数はオブジェクトの中にある]

obj.methods
obj.methods.grep(/my/) # => [:my_method]

# [板書: メソッドはクラスの中にある]

# メソッド vs. インスタンスメソッド

MyClass.instance_methods == obj.methods # => true
MyClass.methods == obj.methods # => false

# クラス "も" オブジェクトである

obj.class # => MyClass
MyClass.class # => Class

Class.instance_methods(false) # => [:allocate, :new, :superclass]
MyClass.new
# mod.instance_methods(all = true)
# 配列には親クラスやインクルードしているモジュールのメソッドも含まれます。
# 引数にfalseを指定すると、そのクラスやモジュールで定義されているメソッドだけが返ります。
# http://ref.xaio.jp/ruby/classes/module/instance_methods

# スーパークラスを調べる

MyClass.superclass # => Object
Array.superclass # => Object

# [板書に追記]

Object.superclass # => BasicObject
BasicObject.superclass # => nil

# クラス名は定数である

X = 'hello'
Y = X
Y # => 'hello'

MyOtherClass = MyClass
MyOtherClass.new

Y = 10
Array = MyClass
# [pryを再起動する]

# モジュールとは?

Class.superclass # => Module
Class.instance_methods
Class.instance_methods - Module.instance_methods
Class.instance_methods(false) # => [:allocate, :new, :superclass]

# まとめて書いてみよう

# [調べながら、図を買いてみる]

class MyClass
  def my_method
    @v = 1
  end
end

obj1 = MyClass.new
obj2 = MyClass.new
obj1.my_method
obj1.class # => MyClass
obj2.class # => MyClass
MyClass.superclass # => Object
MyClass.class # => Class
Class.superclass # => Module

# 課題: 1.missing_lines
# [missing_lines.jpg を配布]

# メソッドを見つける仕組み

# [REPLを再起動する]

class MyClass
  def my_method
    @v = 1
  end
end

class MySubclass < MyClass
end

obj = MySubclass.new
obj.my_method() # => 1

# [板書の図を更新]

obj.__id__
MySubclass.ancestors # => [MySubclass, MyClass, Object, Kernel, BasicObject]

obj.method(:__id__)
obj.method(:__id__).owner # => BasicObject

# モジュールとmodules and lookup

module M1
  def my_method
    'M1#my_method()'
  end
end

class C1
  include M1
end

class D1 < C1; end

# [図を板書する]
D1.ancestors # => [D1, C1, M1, Object, Kernel, BasicObject]

# Prepend メソッド

class C2
  prepend M1
end

class D2 < C2; end

D2.ancestors # => [D2, M1, C2, Object, Kernel, BasicObject]
# [図を板書する]

# self メソッド

# [REPLを再起動する]

class MyClass
  def testing_self
    @var = 10
    my_method
    self
  end

  def my_method
    @var = @var + 1
  end
end

obj = MyClass.new

# [draw diagram]

obj.testing_self # => #<MyClass:0x007f91d20eec58 @var=11>

# クラス定義とselfメソッド

class MyClass
  self # => MyClass
end

# self はトップレベル

self # => main
self.class # => Object

# Kernel メソッド

Object.ancestors # => [Object, Kernel, BasicObject]

module Kernel
  def greet
    'Hello!'
  end
end

"abc".greet # => "Hello!"
"abc".class.ancestors # => [String, Comparable, Object, Kernel, BasicObject]

self.greet # => "Hello!"
greet      # => "Hello!"

# 課題: 1.tangle_of_modules

# 配布: object_model_1_wrap_up.md
