# 最長の区間 (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_twopointers_step4

# 区間の前と後ろを全探索すると計算量が O(N^2) になって実行時間制限に間に合わなくなってしまいます。
# そこで しゃくとり法 というアルゴリズムを用います。
# しゃくとり法についてはこのpaiza開発日誌の過去の記事に詳しく書いてあるので参照してみてください。
# 今回の問題では、区間の末尾と先頭の更新条件は次の通りになります。
# 末尾（左端）++ : 区間の総和が M を超えたとき
# 先頭（右端）++ : 区間の総和が M 以下のとき
# 前問と異なり、最大の区間を求めたいので、条件を満たす時にはさらに良い答えを出すために区間を伸ばし、条件を満たさないときには区間を縮めるというしゃくとり法になります。
# しゃくとり法は、アルゴリズムの理解以上に実装が難しくバグを埋め込みやすいので、何度か書いて慣れてみてください。

# -------------------------------------------------

# しゃくとり法による解法 1

n, m = gets.chomp.split.map { |v| v.to_i }

a = []
a << gets.chomp.split.map { |v| v.to_i }
a.flatten!

result = 0
right = 0
sum = 0

# 最大の区間を求めたいので、条件を満たすときにはさらに良い答えを出すために区間を伸ばし、条件を満たさないときには区間を縮める
(0..(n - 1)).each do |left|
  # 要素の和 sum が指定の値 m 以下の間は、そのときの区間の長さ right - left とそれまでの区間の最長 result を比較し、長い方を result に代入する処理を繰り返し行う
  while right < n && sum + a[right] <= m
    sum += a[right]
    right += 1
    result = [result, right - left].max
  end

  if right == left
    right += 1
  end

  # 要素の和 sum が指定の値 m を越えた場合は、そのときの区間の左端の要素 a[left] を sum から引き、左端 left をインクリメントする（left の更新）ための準備を行う
  sum -= a[left]
end

puts result

# -------------------------------------------------

# しゃくとり法による解法 2

n, m = gets.chomp.split.map { |v| v.to_i }

a = []
a << gets.chomp.split.map { |v| v.to_i }
a.flatten!

result = 0
right = 0
sum = 0

# 最大の区間を求めたいので、条件を満たす時にはさらに良い答えを出すために区間を伸ばし、条件を満たさないときには区間を縮める
(0..(n - 1)).each do |left|
  # 要素の和 sum が指定の値 m 以下の間は、そのときの区間の長さ right - left とそれまでの区間の最長 result を比較し、長い方を result に代入する処理を繰り返し行う
  # 条件を満たす間は、さらに良い答えを出すために right に +1 して区間を伸ばす
  until n <= right || m < sum + a[right]
    sum += a[right]
    right += 1
    if result < right - left
      result = right - left
    end
  end

  if right == left
    right += 1
  end

  # 要素の和 sum が指定の値 m を越えた場合は、そのときの区間の左端の要素 a[left] を sum から引き、左端 left をインクリメントする（left の更新）ための準備を行う
  sum -= a[left]
end

puts result

# -------------------------------------------------

# しゃくとり法による解法 3

n, m = gets.chomp.split.map { |v| v.to_i }

a = []
a << gets.chomp.split.map { |v| v.to_i }
a.flatten!

result = 0
left = 0
right = 0
sum = 0

sum = a[0]

# 最大の区間を求めたいので、条件を満たす時にはさらに良い答えを出すために区間を伸ばし、条件を満たさないときには区間を縮める
# 要素の和 sum が指定の値 m 以下の間は、区間を伸ばすため右端 right をインクリメントし（right の更新）、そのときの区間の長さ right - left とそれまでの区間の最長 result を比較し、長い方を result に代入する処理を繰り返し行う
# 要素の和 sum が指定の値 m を越えた場合は、そのときの区間の左端の要素 a[left] を sum から引き、左端 left をインクリメントする（left の更新）
while true
  if m < sum
    sum -= a[left]
    left += 1
  else
    right += 1
    result = [result, right - left].max
    if right == n
      break
    else
      sum += a[right]
    end
  end
end

if right == left
  right += 1
end

puts result

# -------------------------------------------------

# 累積和による解法 1

n, m = gets.chomp.split.map { |v| v.to_i }

a = []
a << gets.chomp.split.map { |v| v.to_i }
a.flatten!

s = [0]
n.times do |i|
  s[i + 1] = s[i] + a[i]
end

result = 0
left = 0
right = 0

# 区間和が指定の値 m を越えるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m を越えたときは左端 left を +1 動かす（left の更新）
# 区間和が指定の値 m 以下のとき、その区間の長さが、それまでの区間の最長 result より長い場合、その区間の長さを result に代入
# 最大の区間を求めたいため、条件を満たす間は右端 right を動かし、区間の長さを伸ばせるだけ伸ばす
while true
  break if n <= right

  if s[right + 1] - s[left] <= m
    result = [result, right - left + 1].max
    right += 1
  else
    left += 1
  end
end

puts result

# -------------------------------------------------

# 累積和による解法 2

n, m = gets.chomp.split.map { |v| v.to_i }

a = []
a << gets.chomp.split.map { |v| v.to_i }
a.flatten!

s = [0]
n.times do |i|
  s[i + 1] = s[i] + a[i]
end

result = 0
left = 0
right = 0

# 区間和が指定の値 m を越えるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m を越えたときは左端 left を +1 動かす（left の更新）
# 区間和が指定の値 m 以下のとき、その区間の長さが、それまでの区間の最長 result より長い場合、その区間の長さを result に代入
# 最大の区間を求めたいため、条件を満たす間は右端 right を動かし、区間の長さを伸ばせるだけ伸ばす
while right < n

  if s[right + 1] - s[left] <= m
    if result < right - left + 1
      result = right - left + 1
    end
    right += 1
  else
    left += 1
  end
end

puts result