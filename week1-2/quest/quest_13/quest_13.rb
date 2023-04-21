# frozen_string_literal: true

## 2. 電卓

def calculate(num1, num2, operator)
  if !num1.is_a?(Integer) && !num2.is_a?(Integer) && !(num1.to_i == num1 && num2.to_i == num2)
    raise TypeError, 'num1、num2には整数を入力してください'
  end

  raise ArgumentError, '演算子には+、-、*、/ のいずれかを使用してください' unless ['+', '-', '*', '/'].include?(operator)

  raise ZeroDivisionError, 'ゼロによる割り算は許可されていません' if operator == '/' && num2.zero?

  case operator
  when '+'
    num1 + num2
  when '-'
    num1 - num2
  when '*'
    num1 * num2
  when '/'
    num1 / num2
  end
end

puts '1番目の整数を入力してください:'
num1 = gets.chomp.to_f

puts '2番目の整数を入力してください:'
num2 = gets.chomp.to_f

puts '演算子(+, -, *, /)を入力してください:'
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
rescue ZeroDivisionError
  puts 'ゼロによる割り算は許可されていません'
rescue TypeError
  puts 'num1、num2には整数を入力してください'
rescue ArgumentError
  puts '演算子には+、-、*、/のいずれかを使用してください'
end
