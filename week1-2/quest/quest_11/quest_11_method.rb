# frozen_string_literal: true

class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
    @deposit = 0
  end

  def deposit_coin(coin)
    return unless coin == 100

    @deposit += 100
  end

  def press_button
    return unless @deposit >= 100

    return 'cider'
    @deposit -= 100
  end

  private

  def press_manufacturer_name
    @manufacturer_name
  end
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_button

vending_machine.deposit_coin(150)
puts vending_machine.press_button

vending_machine.deposit_coin(100)
puts vending_machine.press_button

puts vending_machine.press_manufacturer_name
