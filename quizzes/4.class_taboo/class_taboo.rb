# -*- coding: utf-8 -*-

# Tabooというゲームを知っていますか? ルールはシンプルで、
# 秘密の言葉と使ってはいけない言葉 (タブー) が渡されるので、
# タブーを使わずに、チームメイトに秘密の言葉を気づかせるゲームです。
#
# 課題: RubyでTabooをプレイしてみましょう。
# 今回のタブーは「classキーワード」です。
# そして秘密の言葉は「Rubyのクラス名」です。
# タブーを使わずに、秘密の言葉を出力してみましょう。

class MyClass < Array
  def my_method
    'Hello!'
  end
end

# classキーワードを使わずに、上記のコードを改造してみてください。
# なお、テストは常に成功している状態にしておかなければなりません。
#
# つまり、プログラムの振る舞いが変わっていないか
# テストを使って確認しながら、コードを書き直してください。
# ただし、classキーワードはタブーなので使ってはいけません。
#
# 最終的にクラス名を出力できたら、あなたの勝ちです。
# 準備はできましたか?
#
# ヒント: 詰まったらClass.new()のドキュメントを読んでみましょう.
# classはタブーですが、Classクラスは使っても大丈夫です :)
# http://docs.ruby-lang.org/ja/2.0.0/class/Class.html

require 'test/unit'

class TestClassTaboo < Test::Unit::TestCase
  def test_a_MyClass_is_an_Array
    assert_same Array, MyClass.superclass
  end

  def test_a_MyClass_has_a_my_method
    obj = MyClass.new
    assert_equal 'Hello!', obj.my_method
  end
end
