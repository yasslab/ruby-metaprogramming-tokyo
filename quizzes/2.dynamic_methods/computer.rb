# -*- coding: utf-8 -*-
# ghost_methodsと同じ課題ですが、
# 今回はdefine_method()を使って
# 冗長なコードを削除してみてください!
#
# ルールは前回と全く同じです。
# テストやデータソースには一切触れずに
# computer.rbの中身のみ修正してください。
#
# 冗長なコードが動的ディスパッチで削除できて、
# かつ、テストも無事に通っていれば成功です!

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def mouse
    info   = @data_source.get_mouse_info(@id)
    price  = @data_source.get_mouse_price(@id)
    result = "Mouse: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def cpu
    info   = @data_source.get_cpu_info(@id)
    price  = @data_source.get_cpu_price(@id)
    result = "Cpu: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def keyboard
    info   = @data_source.get_keyboard_info(@id)
    price  = @data_source.get_keyboard_price(@id)
    result = "Keyboard: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end
