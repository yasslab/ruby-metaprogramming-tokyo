# -*- coding: utf-8 -*-


local_var = "成功!"

MyClass = Class.new do
  # local_var をここに表示したい...
  puts local_var # => 成功!

  define_method :my_method do
    # local_var をここに表示したい...
    puts local_var # => 成功!
  end
end

MyClass.new.my_method
