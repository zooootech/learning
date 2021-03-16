# 1行目の英大文字 X から、2行目の英大文字 Y の範囲に3行目のアルファベット C が含まれていれば"true", そうでなければ"false"と出力してください。
# X が Y よりもアルファベット順で後ろになる場合(X = 'G', Y = 'F'のときなど)も"false"と出力してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# X
# Y
# C

# 入力値最終行の末尾に改行が１つ入ります。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 出力は、 "true" または "false" のどちらかです。


# 条件
# ・X, Y, Cはそれぞれ英大文字です。


# 入力例1
# A
# D
# C

# 出力例1
# true

# 入力例2
# D
# D
# D

# 出力例2
# true

# 入力例3
# A
# D
# Z

# 出力例3
# false

# -------------------------------------------------

str1 = gets.chomp
str2 = gets.chomp
str3 = gets.chomp

puts (str1.ord <= str3.ord) && (str3.ord <= str2.ord)

# -------------------------------------------------

string = []
3.times { string.push(gets.chomp) }

puts string[0].ord <= string[2].ord && string[2].ord <= string[1].ord

# -------------------------------------------------

str1 = gets.chomp
str2 = gets.chomp
str3 = gets.chomp

result = false
(str1..str2).each do |str|
  if str == str3
    result = true
  end
end

puts result