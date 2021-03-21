# 1行目で血液型が1つ与えられます。
# m 行の血液型と占い結果の組が与えられるので、血液型をキー、占い結果を値として、連想配列（辞書）に保存してください。
# その後、1行目で与えられた血液型に対応する占い結果を表示してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# T
# m
# A_1 B_1
# A_2 B_2
# ...
# A_i B_i
# ...
# A_m B_m

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。

# 期待する出力
# A_i をキー、B_i を値として保存し、A_i と T が同じ場合、B_i を表示してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ m ≦ 4
# ・A_i の値は、"A", "B", "AB", "O"のいずれかであり、同じ血液型が複数入力されることはない
# ・1 ≦ (文字列 B_i の長さ) ≦ 100
# ・T の値は、"A", "B", "AB", "O"のいずれか


# 入力例1
# A
# 4
# A Good
# B VeryGood
# O Yavai
# AB VeryYavai

# 出力例1
# Good

# 入力例2
# B
# 4
# A Good
# B VeryGood
# O Yavai
# AB VeryYavai

# 出力例2
# VeryGood

# 入力例3
# O
# 4
# A Good
# B VeryGood
# O Yavai
# AB VeryYavai

# 出力例3
# Yavai


blood = gets.chomp
count = gets.to_i
hash = {}

for i in 1..count
  line = gets.chomp.split(" ")
  hash[line[0]] = line[1]
end

hash.each do |k, v|
  if k == blood
    puts "#{v}"
  end
end

# -------------------------------------------------

blood_type = gets.chomp
num = gets.chomp.to_i

fortunes = {}

(1..num).each do
  array = gets.chomp.split(' ')
  fortunes[array[0]] = array[1]
end

puts fortunes[blood_type]