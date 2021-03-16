# 1行目に行数を表す整数 n、続く n 行の各行で「文字」と「整数」の組が空白区切りで入力されます。
# n 個の組について、「文字」の値が同じ組同士の数値を足しわせてまとめ、まとめた数値の降順で、文字とまとめた数値の組を出力してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# n
# S_1 D_1
# S_2 D_2
# ...
# S_i D_i
# ...
# S_n D_n

# S_i は「文字」で、D_i は「整数」です。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 文字とまとめた数値の組を各行で出力してください。
# 文字と数値は半角スペースで区切ってください。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ n ≦ 10,000
# ・-10,000 ≦ D_i ≦ 10,000 (ただし、1 ≦ i ≦ n)
# ・S_iは1つの半角英文字


# 入力例1
# 7
# A 1
# D 6
# C 2
# G 4
# B 70
# A 10
# B 5

# 出力例1
# B 75
# A 11
# D 6
# G 4
# C 2

# 入力例2
# 3
# G 0
# S 3
# E -2

# 出力例2
# S 3
# G 0
# E -2

# 入力例3
# 5
# A -2
# E 0
# W -5
# A -1
# E -20

# 出力例3
# A -3
# W -5
# E -20a

# -------------------------------------------------

count = gets.to_i

hash = {}
for i in 1..count
  line = gets.chomp.split(" ")
  if hash[line[0]]
    hash[line[0]] = hash[line[0]] + line[1].to_i
  else
    hash[line[0]] = line[1].to_i
  end
end

hash.sort_by {|k, v| -v}.to_h.each do |key, value|
  puts "#{key} #{value}"
end

# -------------------------------------------------

count = gets.to_i

hash = {}
for i in 1..count
  line = gets.chomp.split(" ")
  if hash[line[0]]
    hash[line[0]] = hash[line[0]] + line[1].to_i
  else
    hash[line[0]] = line[1].to_i
  end
end

hash.sort {|(k1, v1), (k2, v2)| v2 <=> v1}.to_h.each do |key, value|
  puts "#{key} #{value}"
end

# -------------------------------------------------

num = gets.chomp.to_i
array = {}

(1..num).each do
  values = gets.split(' ')
  string = values[0]
  points = values[1].to_i

  if array[string]
    current = array[string]
    array[string] = current + points
  else
    array[string] = points
  end
end

array = array.sort_by { |_string, points| -points }

array.each { |string, points| puts "#{string} #{points}" }