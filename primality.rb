# 素数判定 (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_calculation_step3

# 素数の定義は、 「１とその数以外の約数を持たないような数」 です。
# しかし、次のように 2 から N までの数を全て調べるとループが最大で 10 ^ 10 回ってしまい、 実行時間制限に間に合いません。
# しかし、実は調べるのは Nの0.5乗（ルートN） まででいいです。
# なぜかというと、 N に 1 と N 以外の約数があると仮定した場合、少なくとも 1 つは N の 0.5 乗（ルート N ） 以下の約数があることになるからです。
# なお、N = 1 のときはこの判定法が使えないので注意してください。


# 素数（prime number）とは、1 より大きい自然数で、正の約数が 1 と自分自身のみであるもののことである。正の約数の個数が 2 である自然数と言い換えることもできる。1 より大きい自然数で素数でないものは合成数と呼ばれる。

# また、nが何らかの数pで割り切れる場合、n=pqであり、qがpより小さい場合には既にqもしくはqの約数で確かめた際に素因数が検出されているはずである。したがって、素因数候補として確かめるべきは√nまでで十分ある。

# -------------------------------------------------

# primeライブラリを用いた解法 1

# Prime ライブラリの中心にあるのは Prime クラスで、これは素数全体を表すシングルトンです。また、素数性と素因数分解に関するメソッドを Integer に追加します。
# Prime クラスはデフォルトのインスタンスを持っており、ユーザーはそのインスタンスを利用すべきです。 Prime.instance によってそのインスタンスを取得できます。

require 'prime'

n = gets.to_i

# インスタンスメソッド prime? は与えられた整数が素数である場合は、真を返します。そうでない場合は偽を返します。
if n.prime?
  puts "YES"
else
  puts "NO"
end

# -------------------------------------------------

# primeライブラリを用いた解法 2

require 'prime'

n = gets.to_i

# インスタンスメソッド prime? は与えられた整数が素数である場合は、真を返します。そうでない場合は偽を返します。
if Prime.instance.prime?(n)
  puts "YES"
else
  puts "NO"
end

# -------------------------------------------------

n = gets.to_i

flag = true  # 初期値を true に設定するのは、 while 以下の処理が一度も行われない(while の条件式の評価がはじめから偽)場合、整数 n は素数に該当するため

if n == 2  # n が 2 ならば n は素数
  flag = true
elsif n % 2 == 0 || n < 2  # n が 2 で割り切れる(偶数)、または n が 2 未満の場合、 n は素数ではない
  flag = false
else
  i = 3

  # Math.sqrt(x) は x の平方根を返します。
  # sqrt は square root (平方根) の略。
  while i <= Math.sqrt(n)  # i が与えられた整数 n の平方根以下の間、繰り返し処理を行う
    if n % i == 0  # i で割り切れる場合、n は素数ではない
      flag = false
    end
    i += 2  # 割る数が奇数のときのみ調べたいので i を 2 ずつ増やす
  end
end

if flag
  puts "YES"
else
  puts "NO"
end

# -------------------------------------------------

n = gets.to_i

flag = true  # 初期値を true に設定するのは、 while 以下の処理が一度も行われない(while の条件式の評価がはじめから偽)場合、整数 n は素数に該当するため

if n == 2  # n が 2 ならば n は素数
  flag = true
elsif n % 2 == 0 || n < 2  # n が 2 で割り切れる(偶数)、または n が 2 未満の場合、 n は素数ではない
  flag = false
else
  i = 3

  # 算術演算子 ** で平方根を計算する場合は、計算する数値を 1 / 2 乗(0.5 乗)することで求められます。
  # x ** (1 / 2.0) で x の平方根を返します。
  # sqrt は square root (平方根) の略。
  while i <= (n ** (1 / 2.0))  # i が与えられた整数 n の平方根以下の間、繰り返し処理を行う
    if n % i == 0
      flag = false
    end
    i += 2
  end
end

if flag
  puts "YES"
else
  puts "NO"
end

# -------------------------------------------------

def prime?(n)
  return false if n < 2
  return true  if n == 2 or n == 3
  return false if (n % 2).zero?
  3.step(Math.sqrt(n).to_i, 2) {|i| return false if (n % i).zero?}
  true
end

n = gets.to_i

if prime?(n)
  puts "YES"
else
  puts "NO"
end

# -------------------------------------------------

def isPrime?(i)
  # 1 は素数ではない
  return false if i == 1

  # 2 は素数
  return true if i == 2

  judge = true
  (2..i).each do |j|
    # 繰り返し処理は root i までで十分なので
    break if j > i ** 0.5 
    if i % j == 0
      judge = false
      break
    end
  end
  return judge
end

n = gets.to_i

if isPrime?(n)
  puts "YES"
else
  puts "NO"
end

# -------------------------------------------------

def trial_division(target)
  dest = Math.sqrt(target)

  return false if target < 2
  return true  if target == 2 or target == 3
  return false if (target % 2).zero?

  for i in 3..dest
    if target % i == 0
      return false
    end
  end

  true
end

n = gets.to_i

if trial_division(n)
  puts "YES"
else
  puts "NO"
end