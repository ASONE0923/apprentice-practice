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

  def press_button(drink)
    return unless @deposit >= drink.price && (drink.name == 'cider' || drink.name == 'cola')

    return drink.name
    @deposit -= drink.price
  end

  private

  def press_manufacturer_name
    @manufacturer_name
  end
end

class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

cola = Drink.new('cola', 150)
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
