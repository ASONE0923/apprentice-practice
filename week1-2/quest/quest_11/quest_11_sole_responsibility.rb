class VendingMachine
    def initialize(manufacturer_name)
      @manufacturer_name = manufacturer_name
      @deposit = 0
    end
  
    def deposit_coin(coin)
      if coin == 100
        @deposit += 100
      end
    end
  
    def press_button(drink)
      if @deposit >= drink.price && (drink.name == "cider" || drink.name == "cola")
        return drink.name
        @deposit -= drink.price
      end
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