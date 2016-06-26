# -*- coding: utf-8 -*-

# 動的ディスパッチ

class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
obj.my_method(3)        # => 6
obj.send(:my_method, 3) # => 6


# 動的メソッド定義

class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
obj.my_method(2) # => 6

## 課題: 2.dynamic_methods


# ゴーストメソッド

## method_missing (メソッドミッシング)

obj.unknown_method # エラー!

BasicObject.private_instance_methods # method_missing() は private
obj.method_missing(:my_method)       # private なので実行できない!
obj.send :method_missing, :my_method # send()経由でも実行できない!

## [図を使って説明する]

class C
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

obj = C.new
obj.unknown_method('a', 'b') do
  # a block
end

## 課題: 2.ghost_methods


# 応用課題: 2.bug_hunt

# 議論してみよう: ゴーストメソッド vs. 動的メソッド

