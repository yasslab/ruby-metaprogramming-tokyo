# -*- coding: utf-8 -*-
# まずは次のコードを読んでください
# (まだ実行はしないでください)

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

# このクラスがうまくできていれば
# 次のように使えるにしたいです。

number_of = Roulette.new
puts number_of.bob
puts number_of.frank

# 結果は次のように欲しいのですが...
#
#   5...
#   6...
#   3...
#   Bob got a 3
#   7...
#   4...
#   10...
#   Frank got a 10
#
# が、実際は、このようにうまく動いてくれません ><
# 実行する前に、その原因について考えてみてください。
#
# バグの原因がわからなかったら、コードを実行してみましょう
# 何が起こっているか説明することができますか?
# (言葉で説明するのは難しいかもしれませんが、なんとなく理解できていれば十分!)
#
# 最後に、このバグを実際に直してみてください!
# どんな修正方法がありますか?











