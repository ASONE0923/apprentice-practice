# frozen_string_literal: true

# 1.比較

def greater(x, y)
  if x > y
    puts 'x > y'
  elsif x < y
    puts 'x < y'
  elsif x == y
    puts 'x == y'
  end
end

greater(5, 4)
greater(-50, -40)
greater(10, 10)

# 2.電車の料金
def train_fare(age)
  if age >= 12
    puts 200
  elsif age >= 6 && age < 12
    puts 100
  elsif age <= 6
    puts 0
  end
end

train_fare(12)
train_fare(6)
train_fare(5)
