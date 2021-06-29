# フィボナッチ数列

# フィボナッチ数 - シンプル
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 ...

n = gets.to_i

# 指定番のフィボナッチ数を求める
def fibonacci(num)
  if num == 0
    return num  # return は省略可
  elsif num == 1
    return num  # return は省略可
  else
    fibo = 0
    fibo_0 = 0
    fibo_1 = 1

    i = 1
    while i < num
      fibo = fibo_0 + fibo_1

      fibo_0 = fibo_1
      fibo_1 = fibo
      
      i += 1
    end

    return fibo  # return は省略可
  end
end

(n + 1).times do |j|
  puts "#{j} : #{fibonacci(j)}"
end

# -------------------------------------------------

# フィボナッチ数 - 配列
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 ...

# このプログラムでは配列を使っているので、二重ループによる余分な処理がありません。
# n 番目のフィボナッチ数を求める場合には、シンプルなプログラムと計算量に差はありませんが、 0 番目から n 番目のフィボナッチ数を出力するという場合には、シンプルなプログラムに比べて計算量が少なく高速に動作します。

n = gets.to_i

fibo = []

fibo[0] = 0
fibo[1] = 1

(0..n).each do |i|
  if i >= 2
    fibo[i] = fibo[i - 1] + fibo[i - 2]
  end
  
  puts "#{i} : #{fibo[i]}"
end

# -------------------------------------------------

# フィボナッチ数 - シンプル再帰
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 ...

# このプログラムの場合、 n の値が大きすぎるとタイムアウトになります。
# 再帰呼び出しでは自分自身を呼び出すために処理がみるみる大きくなってしまうからです。

n = gets.to_i

# 指定番のフィボナッチ数を求める
def fibonacci(num)
  if num == 0
    num
  elsif num == 1
    num
  else
    # 2 つの再帰処理
    fibonacci(num - 1) + fibonacci(num - 2)
  end
end

(n + 1).times do |i|
  puts "#{i} : #{fibonacci(i)}"
end

# -------------------------------------------------

# フィボナッチ数 - 再帰1回
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 ...

n = gets.to_i

# 指定番のフィボナッチ数を求める
def fibonacci(num)
  fib2(0, 1, num)
end

def fib2(a, b, c)
  # 引数 c が 1 未満になったら 変数 a を返す
  if c < 1
    a
  else
    # fib2メソッドの再帰呼び出しでは、1 番目の引数に現在のフィボナッチ数を、 2 番目の引数に 1 つ前のフィボナッチ数を渡している
    # 3 番目の引数には c - 1 を渡し、この値が 0 になるまで再帰処理を行う
    fib2(a + b, a, c - 1)
  end
end

(n + 1).times do |i|
  puts "#{i} : #{fibonacci(i)}"
end

# -------------------------------------------------

# フィボナッチ数 - パラレルアサインメント 1
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 ...

n = gets.to_i

def fibonacci(n)
  if n == 0
    n
  elsif n == 1
    n
  else
    a, b = 0, 1
    n.times do
      a, b = b, a + b
    end
    a
  end
end

puts fibonacci(n)

# -------------------------------------------------

# フィボナッチ数 - パラレルアサインメント 2
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233 ...

n = gets.to_i

def fibonacci(n)
  return   if n < 0  #  0 より小さい値を入力した場合、 nil を返すようにします
  return n if n < 2
  a, b = 0, 1
  n.times { a, b = b, a + b }  # パラレルアサインメント
  a
end

puts fibonacci(n)