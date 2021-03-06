# 最大公約数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_calculation_boss

# 素直に min(A,B) から 1 にむけて繰り返しを用いて次のように最大公約数を探すと、 ループ回数が最大で 10 ^ 10 になってしまうので実行時間制限に間に合いません。
# そこで、 ユークリッドの互除法 を用います。これは 「AとBの最大公約数は、BとA%Bの公約数と等しい」 という性質を利用して最大公約数を求める方法です。 この方法を用いると計算量がO(log(max(A, B)))となります。

# ユークリッドの互除法

# 1. a を b で割った余りを求める。
# 2. 余りが 0 の場合、b が最大公約数。
# 3. 余りが 0 以外の場合、除数(割った数)を先程の余りで割りその余りを求める。
# 4. これを余りが 0 になるまで繰り返す。余りが 0 になった時の除数が最大公約数

# x を y で割り、余り r を求める
# y を r で割り、その余り r_1 を求める
# r を r_1 で割り、その余り r_2 を求める
# これを繰り返し、余りが 0 になったときの割る数が最大公約数

# -------------------------------------------------

a, b = gets.split.map(&:to_i)

# gcd(n) は自身と整数 n の最大公約数を返します。また、self や n が 0 だった場合は、0 ではない方の整数の絶対値を返します。
puts a.gcd(b)

# -------------------------------------------------

a, b = gets.split.map(&:to_i)

while true
  remainder = a % b
  
  if remainder == 0
    break
  end

  a, b = b, remainder
end

puts b