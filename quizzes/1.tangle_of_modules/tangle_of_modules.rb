# -*- coding: utf-8 -*-

# NOTE:
# この課題では、コードを修正するのは最後だけで十分です。
# まずはコードを眺めていて、どういう風に動きそうか、
# その振る舞いについて考えてみてください。
#
# QUIZ: Tangle_of_Modules
# あなたの会社にはレガシーな印刷システムがあります。
# そのバグトラッカーに、次のようなバグ報告がありました。
#
# 「print_to_screen() メソッドが、私が定義した
# 　print() メソッドを正しく呼び出してくれません😭」
#
# プログラムを実行してみて、まずは何が起こっているのか確認してみましょう。
# その後、(バグ修正を始める前に) 問題の原因について考えてみてください。
# この課題を解くためのヒントは、次の２つです。
#
# 1. (紙の裏や余白などに) Bookクラスの継承チェーンの図を書いてみましょう。
#    次に、図を見ながらどのprint()メソッドが呼び出されているのか確認します。
#    Printableのprint()でしょうか? それとも、Documentのprint()でしょうか?
#
# 2. print_to_screen()がもう一方のprint()メソッドを呼び出すために、
#    どういった修正方法があるでしょうか? いくつか考えてみてください。
#
# コードを修正する前に、まずはどんな解決方法があるか考えてみてください。
# その後、自分の考えが合っているかどうか、コードを修正・実行してみてください。
# 最後に、他にどんな修正方法があるのか考えてみてください。

module Printable
  def print
    puts "Printable#print()"
  end

  def prepare_cover
    # there is code here, but we don't care about it
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    # we don't care about this code either
  end

  def print
    puts "Document#print()"
  end
end

class Book
  include Document
  include Printable
  # ...
end

b = Book.new
b.print_to_screen
