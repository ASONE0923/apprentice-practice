## 2. 電卓

def calculate(num1, num2, operator)
  if !num1.is_a?(Integer) || !num2.is_a?(Integer)
    raise TypeError, "num1、num2には整数を入力してください"
  elsif operator != "+" && operator != "-" && operator != "*" && operator != "/"
    raise ArgumentError, "演算子には+、-、*、/ のいずれかを使用してください"
  elsif operator == "/" && num2 == 0
    raise ZeroDivisionError, "ゼロによる割り算は許可されていません"
  end

  case operator
  when "+"    
    return num1 + num2
  when "-"
    return num1 - num2
  when "*"
    return num1 * num2
  when "/"
    return num1 / num2
  end
end
  
puts "1番目の整数を入力してください:"
num1 = gets.chomp.to_i

puts "2番目の整数を入力してください:"
num2 = gets.chomp.to_i

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
  rescue ZeroDivisionError
    puts "ゼロによる割り算は許可されていません"
  rescue TypeError
    puts "num1、num2には整数を入力してください"
  rescue ArgumentError
    puts "演算子には+、-、*、/のいずれかを使用してください"
end
  
calculate(1, 0, '/')
calculate(1.5, 2, '+')
calculate(1.5, 2, '**')
calculate(5, 2, '*')