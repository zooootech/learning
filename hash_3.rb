# 1行目でユーザーが1つ与えられます。
# n 行のユーザーと血液型の組が与えられるので、ユーザーをキー、血液型を値として、連想配列（辞書）に保存してください。
# その連想配列（辞書）の中で1行目で与えられたユーザー名と、ユーザー名に対応する血液型を表示してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# s
# n
# A_1 B_1
# A_2 B_2
# ...
# A_i B_i
# ...
# A_n B_n

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# A_i をキー、B_i を値として保存し、A_i と s が同じ場合、A_i と B_i を表示してください
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ n ≦ 100
# ・1 ≦ (s の長さ) ≦ 50
# ・1 ≦ (A_i の長さ) ≦ 50
# ・B_i の値は "A", "B", "AB", "O"のいずれか
# ・i ≠kのとき、A_i と A_k は異なる文字列


# 入力例1
# Kyoko
# 5
# Kyoko B
# Rio O
# Tsubame AB
# KurodaSensei A
# NekoSensei A

# 出力例1
# Kyoko B

# 入力例2
# otomeza
# 5
# shishiza O
# yagiza O
# otomeza AB
# mizugameza B
# futagoza A

# 出力例2
# otomeza AB

# 入力例3
# EEE
# 5
# AAA A
# BBB B
# CCC A
# DDD AB
# EEE O

# 出力例3
# EEE O


user = gets.chomp
count = gets.to_i
hash = {}

for i in 1..count
  line = gets.chomp.split(" ")
  hash[line[0]] = line[1]
end

hash.each do |k, v|
  if k == user
    puts "#{k} #{v}"
  end
end

# -------------------------------------------------

user = gets.chomp
num = gets.chomp.to_i

user2blood = {}

(1..num).each do
  array = gets.chomp.split(' ')
  user2blood[array[0]] = array[1]
end

puts user + ' ' + user2blood[user]