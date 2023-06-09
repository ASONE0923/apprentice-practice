class VendingMachine
    def initialize(manufacturer_name)
      @manufacturer_name = manufacturer_name
      @deposit = 0
      @cup_count = 0
      @max_cup_count = 100
    end
  
    def deposit_coin(coin)
      if coin == 100
        @deposit += 100
      end
    end
  
    def press_button(item)
      if @deposit >= item.price
        if item.is_a?(Drink) && (item.name == "cider" || item.name == "cola")
          @deposit -= item.price
          return item.name
        elsif item.is_a?(CupCoffee) && @cup_count > 0
          @deposit -= item.price
          @cup_count -= 1
          return "hot cup coffee" if item.temperature == "hot"
          return "iced cup coffee" if item.temperature == "iced"
        end
      end
      return ""
    end
  
    def add_cup(count)
      @cup_count = [@cup_count + count, @max_cup_count].min
    end
  
    private
  
    def press_manufacturer_name
      @manufacturer_name
    end
end
  
class Item
    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end
end

class Drink < Item
end

class CupCoffee < Item
    attr_reader :temperature

    def initialize(temperature)
        @temperature = temperature
        super("cup coffee", 100)
    end
end

hot_cup_coffee = CupCoffee.new('hot')
cider = Drink.new('cider', 100)
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)
