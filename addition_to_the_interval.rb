# 区間への足し算 (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_twopointers_step5

# 全てのクエリを問題文の通り処理すると、計算量が O(N^2) となってしまいます。
# そこで、累積和を用いた imos法 というアルゴリズムを用いることで計算量を落とすことができます。 imos法の概要は次の通りです。
# クエリ用の配列addを用意し、区間 [a,b] に c を足すという処理を行う場合、
# add[a] += c; add[b+1] -= c; をおこないます。（このとき配列の範囲外にアクセスしないように注意してください。）
# 全てのクエリの処理が終わったら、 add についての累積和 add_i を A[i] に足します。
# 実際に紙などに書いて実験してみると理解が捗ると思うのでぜひ add の動きを試してみてください。

# -------------------------------------------------

# imos法による解法 1

n, m = gets.chomp.split.map(&:to_i)

numbers = []
numbers << gets.chomp.split.map(&:to_i)
numbers.flatten!

add = [0] * (n + 1)
m.times do
  l_i, u_i, a_i = gets.chomp.split.map(&:to_i)
  add[l_i - 1] += a_i
  add[u_i] -= a_i
end

numbers.each_with_index do |number, i|
  puts number += add[i]
  add[i + 1] += add[i]
end

# -------------------------------------------------

# imos法による解法 2

n, m = gets.chomp.split.map(&:to_i)

numbers = []
numbers << gets.chomp.split.map(&:to_i)
numbers.flatten!

add = [0] * (n + 1)
m.times do
  l_i, u_i, a_i = gets.chomp.split.map(&:to_i)
  add[l_i - 1] += a_i
  add[u_i] -= a_i
end

n.times do |i|
  puts numbers[i] + add[i]
  add[i + 1] += add[i]
end

# -------------------------------------------------

# 以下のコードだとタイムオーバーになる

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

queries = []
m.times do
  queries << gets.chomp.split.map(&:to_i)
end

queries.each do |left, right, num|
  ((left + 1)..(right + 1)).each do |index|
    a[index] += num
  end
end

a.each do |b|
  puts b
end
