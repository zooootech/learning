# 累積和の計算 (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_twopointers_step1

# 素直に各 i について A_1 + ... + A_i を行うと、計算量が O(N^2) になってしまい実行時間制限に間に合いません。
# そこで、 sum[i] = sum[i-1] + A[i] という関係を用いて、回答例のように実装をすると計算量を O(N) にすることができます。
# 今回の問題の S を 累積和 といい、計算量を落とす際にしばしば用いられます。


n = gets.to_i
a = []
a << gets.chomp.split.map(&:to_i)
# flatten(lv = nil) は自身を再帰的に平坦化した配列を生成して返します。
# flatten!(lv = nil) は自身を再帰的かつ破壊的に平坦化し、平坦化が行われた場合は self をそうでない場合は nil を返します。
# lv が指定された場合、lv の深さまで再帰的に平坦化します。デフォルト値は nil 。
# lv は平坦化の再帰の深さを整数で指定します。nil を指定した場合、再帰の深さの制限無しに平坦化します。整数以外のオブジェクトを指定した場合は to_int メソッドによる暗黙の型変換を試みます。
a.flatten!

sum = 0
a.each do |i|
  sum += i
  puts sum
end

# -------------------------------------------------

n = gets.to_i
a = []
a << gets.chomp
a = a[0].split.map(&:to_i)

sum = 0
a.each do |i|
  sum += i
  puts sum
end

# -------------------------------------------------

n = gets.to_i
a = [gets.chomp]
a = a[0].split.map(&:to_i)

sum = 0
a.each do |i|
  sum += i
  puts sum
end