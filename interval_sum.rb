# 区間和の計算 (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_twopointers_step2

# 素直に区間の始まりと終わりを全探索して実装すると、計算量が O(N^2) となってしまい実行時間制限に間に合いません。
# そこで、前回の問題で求めた累積和S_iを用います。
# A[l]+...+A[u] = (A[0]+...A[u]) - (A[0]+...A[l-1]) = S[u+1]-S[l]
# の関係より、累積和 S を前もって計算しておけば、回答例の通り、区間 l,u の和を O(1) で求めることができるので
# 全体の計算量を O(N) にできます。

n = gets.to_i
a = [gets.chomp]
a = a[0].split.map(&:to_i)

m = gets.to_i
queries = []
m.times do
  queries << gets.chomp.split.map(&:to_i)
end

# 累積和の前処理
s = []
s[0] = 0
n.times do |i|
  s[i + 1] = s[i] + a[i]
end

queries.each do |left, right|
  puts s[right + 1] - s[left]
end

# -------------------------------------------------・

n = gets.to_i
a = [gets.chomp]
a = a[0].split.map(&:to_i)

# 累積和の前処理
s = [0]
n.times do |i|
  s.push(s[-1] + a[i])
end

m = gets.to_i
m.times do
  l, u = gets.chomp.split.map(&:to_i)

  puts s[u + 1] - s[l]
end

# -------------------------------------------------・

n = gets.to_i
a = [gets.chomp]
a = a[0].split.map(&:to_i)

# 累積和の前処理
s = []
s[0] = 0
n.times do |i|
  s[i + 1] = s[i] + a[i]
end

m = gets.to_i
m.times do
  l, u = gets.chomp.split.map(&:to_i)

  puts s[u + 1] - s[l]
end

# -------------------------------------------------

# 以下のコード（全探索）だとクエリの数によっては計算量が膨大になりタイムアウトとなる

n = gets.to_i
a = [gets.chomp]
a = a[0].split.map(&:to_i)

m = gets.to_i
queries = []
m.times do
  queries << gets.chomp.split.map(&:to_i)
end

queries.each do |left, right|
  sum = 0
  left.upto(right) { |i| sum += a[i] }
  puts sum
end