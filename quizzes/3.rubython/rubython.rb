# -*- coding: utf-8 -*-

# この課題を解くためには、次のことを理解している必要があります:
# - Rubyのブロックがどのように動いているのか
# - Rubyで例外を発生させる方法と例外を捕捉する方法

# Pythonには `with` という構文があります。これはコード実行後に自動的にリソースを解放する構文です。
# C#とJavaにも、同様の機能があります。
# この課題を通して、似たような機構をRubyで実装してみましょう。

# テストで記述された仕様を満たすように、with()メソッドを実装してみましょう。
# なお、リソースは、dispose()メソッドを持った単純なオブジェクトとします。

class Resource
  def dispose
    @disposed = true
  end

  # このメソッドでリソースが
  # 解放できたことを確認します
  def disposed?
    @disposed
  end
end

# with()メソッドに対する仕様は次のとおりです。
# 次のテストを通るように実装してみましょう。

require 'test/unit'

class TestWith < Test::Unit::TestCase

  # with()を呼び出して、解放可能なオブジェクトとブロックを渡したとき、
  # 次のように振る舞います:
  # 1) そのブロック内のコードを実行します
  # 2) リソース (オブジェクト) のdispose()を呼び出します
  def test_disposes_of_resources
    x = 0
    disposable = Resource.new

    with(disposable) do
      x = 1
    end

    assert_equal 1, x
    assert disposable.disposed?
  end

  # たとえブロック内で例外が発生しても、
  # そのリソースは解放されているべきです
  def test_disposes_of_resources_in_case_of_exception
    disposable = Resource.new

    # たとえ例外が発生しても...
    assert_raises(Exception) {
      with(disposable) do
        raise Exception
      end
    }

    # ...そのリソースは解放されているべき
    assert disposable.disposed?
  end
end

# では、Kernelモジュールの１つのメソッドとして、
# 上で記述されたwith()メソッドを実装してみましょう。
# これにより、プログラム中のどこからでも
# with()メソッドを呼び出せるようになります。

# なお、Kernelモジュールの仕組みは知らなくても大丈夫です。
# そこで定義されたメソッドはどこからでもアクセスできる
# とだけ覚えておけば、今のところは問題ありません :)

module Kernel
  def with(disposable_resource)
    # TODO: ここが課題。どういう風に実装しますか?
  end
end
