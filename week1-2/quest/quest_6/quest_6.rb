#1.挨拶

def hello()
    100.times {puts "こんにちは!"} 
end

hello()

#2.羊

def sheep(n)
    num = 1
    while num <= n do
        puts "羊が#{num}匹"
        num += 1
    end
end

sheep(3)

#3.総和

def sum_1_100()
    sum = 0
    for num in 1..100 do
        sum += num
    end
    puts sum
end

sum_1_100()

#4.総和

def sum(x,y)
    total = 0
    while x <= y
        total = total + x
        x += 1
    end
    puts total
end

sum(10, 80)


#5.フィボナッチ数列(advanced)

def fibonacci(n)
    if n == 0
      return 0
    elsif n == 1
      return 1
    else
        fibonacci(n - 1) + fibonacci(n - 2)
    end
end



puts fibonacci(0)
puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(7)
puts fibonacci(30)