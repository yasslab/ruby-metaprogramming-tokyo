# -*- coding: utf-8 -*-
# 次のテストが成功するように、Bufferクラスを実装してみてください

require 'test/unit'

class BufferTest < Test::Unit::TestCase
  def test_buffers_and_plays_actions
    buffer = Buffer.new

    result = 2

    buffer.insert do
      result += 1
    end

    buffer.insert do
      result *= 2
    end

    buffer.insert do
      result += 1
    end

    assert_equal 2, result

    buffer.play

    assert_equal 7, result
  end
end

# Bufferクラスには、コードを実行するのではなく保存させるようにしてみましょう。
# その後、Buffer#playを呼び出したときに、保存したコードを順次実行していきます。
# ヒント: insert/playに加え、初期化用の特別なメソッド「initialize」も使います。

class Buffer
  # TODO: ここにコードを書きます
end
