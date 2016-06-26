# -*- coding: utf-8 -*-

# 世界のどこかにいるRubyistは、
# Module内で次のようなclassメソッドを
# 定義しようとしています。

module MyModule
  def my_method
    'my_method()'
  end
end

class MyClass
  include MyModule
end

MyClass.my_method # => NoMethodError!

puts "OK!"

# コメントにもあるように、上のコードはうまく動きません。
# というのも、Module内ではクラスメソッドではなく
# インスタンスメソッドを定義しているからです。
# MyModuleを一切変更せずに、
# my_methodをMyClassのクラスメソッドにしたい場合
# あなただったらどう実装しますか?
#
# ただし、例外処理とexntend()メソッドは使わないでください。
# ヒント: オブジェクトモデルと特異クラスについて考えてみましょう
#
# 例外などを使わずにMyClass.my_method()を実行するためには
# 上記のコードをどのように変更すればよいでしょうか?
