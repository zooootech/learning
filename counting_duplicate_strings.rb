# 1行目で文字列 s、2行目で文字列 t が入力されます。
# s が t の中で何回出現するかカウントして出力してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# s
# t

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 出現回数を1行で出力してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# 1 ≦ (文字列 s の長さ) ≦ 10,000
# 1 ≦ (文字列 t の長さ) ≦ 10,000
# 文字列 s, t は、半角アルファベットで構成された文字列


# 入力例1
# AA
# abdeeAAbAAAbfde

# 出力例1
# 3

# 入力例2
# el
# scale

# 出力例2
# 0

# 入力例3
# Ji
# JiJiiJiIjiIJjIJi

# 出力例3
# 4

# -------------------------------------------------

# eachの場合

pattern = gets.chomp
string = gets.chomp

result = 0
(0..(string.size - pattern.size)).each do |i|
  substring = string.slice(i, pattern.size)

  result += 1 if substring == pattern
end

puts result

# -------------------------------------------------

# timesの場合

pattern = gets.chomp
string = gets.chomp

result = 0
0..(string.size - pattern.size + 1).times do |i|
  substring = string.slice(i, pattern.size)

  result += 1 if substring == pattern
end

puts result