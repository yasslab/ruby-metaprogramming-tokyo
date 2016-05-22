# -*- coding: utf-8 -*-
# クラス定義内 "も" コードである

class MyClass
  puts 'Hello'
end

# クラス定義は、最後の値を返す

result = class MyClass
  42
end

result = class MyClass
  self
end

# class_eval メソッド

MyClass.instance_eval do
  def m; end
end

# エラー: MyClass.m

MyClass.class_eval do
  self
end

MyClass.class_eval do
  def m; 100; end
end

MyClass.m # => 100

# クラス内のインスタンス変数

class MyClass
  @v = 1
end

# @my_var はどこにある?

class MyClass
  def self.read; @v; end
  def write; @v = 2; end
  def read; @v; end
end

# [図を描いてみる]

obj = MyClass.new
obj.read            # => nil
obj.write
obj.read            # => 2
MyClass.read        # => 1

# (任意) クラス変数と、クラス変数が分かりづらい理由

class C
  @@v = 1
end

class D < C
  def my_method; @@v; end
end

D.new.my_method # => 1

@@v = 1

class MyClass
  @@v = 2
end

@@v # => 2


# 課題: 4.class_taboo

# 得意メソッド (Singleton Method)

str = "just a regular string"

def str.uppercase?
  self.upcase == self
end

str.uppercase?                  # => false
str.methods.grep(/upper/)       # => [:uppercase?]
str.singleton_methods           # => [:uppercase?]

# class メソッドの真実

class C; end
obj = C.new

obj.object_id
C.name

def obj.a_singleton_method; end
def C.a_class_method; end

# [class メソッドの真実を説明する :) ]
# [REPLを再起動する]

# 特異クラス (Singleton Class)

class MyClass
  def my_method; end
end

obj = MyClass.new
obj.my_method

# ["normal" の図を描いてみる]

def obj.my_singleton_method; end
obj.my_singleton_method

def MyClass.my_class_method; end
MyClass.my_class_method

# ["normal" の図を拡張してみる]
# [このメソッドはどこにいった?]

class << obj
  # ここにコードを書く
end

obj = Object.new
singleton_class = class << obj
  self
end
singleton_class       # => #<Class:#<Object:0x007fa0a10b6190>>
singleton_class.class # => Class

"abc".singleton_class # => #<Class:#<String:0x007fa0a10b5880>>

# 特異クラスは、特異メソッドsingleton classes are where singleton methods live

def obj.my_singleton_method; end
singleton_class.instance_methods.grep(/my_/) # => [:my_singleton_method]

# メソッドの調べ方 (再掲)

class C
  def a_method
    'C#a_method()'
  end
end

class D < C; end
obj = D.new
obj.a_method # => "C#a_method()"

# [図を描いてみる]

class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end

# [図を更新する]

# 応用編: 特異クラスと、その継承

class C
  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end

# [図を更新する]

C.singleton_class # => #<Class:C>
D.singleton_class # => #<Class:D>
D.singleton_class.superclass # => #<Class:C>
C.singleton_class.superclass # => #<Class:Object>

# どうしてここまで複雑なのか? (why this complex arrangement?)

D.a_class_method # => "C.a_class_method()"

# [REPLを再起動する]

# エイリアス (aliases)

class MyClass
  def my_method; 'my_method()'; end
  alias_method :m, :my_method
end

obj = MyClass.new
obj.my_method # => "my_method()"
obj.m # => "my_method()"

# エイリアス周りについて

class MyString < String; end

str = MyString.new("test")
str.length # => 4

class MyString
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

MyString.new("Hi!").length           # => "short"
MyString.new("Hello, world!").length # => "long"

# 課題: 4.broken_math
# 配布: object_model_2_wrap_up.md
