# n 行のユーザーと血液型の組が与えられるので、ユーザーをキー、血液型を値として、連想配列（辞書）に保存してください。
# そのあとで連想配列（辞書）をそのまま表示してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# n
# A_1 B_1
# A_2 B_2
# ...
# A_i B_i
# ...
# A_n B_n

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください


# 期待する出力
# 1からnまでの各ユーザーについて順に、ユーザーと血液型を表示してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ n ≦ 100
# ・1 ≦ A_i の長さ ≦ 50
# ・B_i は "A", "B", "AB", "O" のいずれか


# 入力例1
# 5
# Kyoko B
# Rio O
# Tsubame AB
# KurodaSensei A
# NekoSensei A

# 出力例1
# Kyoko B
# Rio O
# Tsubame AB
# KurodaSensei A
# NekoSensei A

# 入力例2
# 5
# shishiza O
# yagiza O
# otomeza AB
# mizugameza B
# futagoza A

# 出力例2
# shishiza O
# yagiza O
# otomeza AB
# mizugameza B
# futagoza A

# 入力例3
# 3
# AAA A
# BBB B
# CCC A

# 出力例3
# AAA A
# BBB B
# CCC A


count = gets.to_i

hash = {}
for i in 1..count
  line = gets.chomp.split(" ")
  hash[line[0]] = line[1]
end

hash.each do |person, blood|
  puts "#{person} #{blood}"
end

# -------------------------------------------------

num = gets.chomp.to_i

user2blood = {}

(1..num).each do
  array = gets.chomp.split(' ')
  user2blood[array[0]] = array[1]
end

user2blood.each { |key, value| puts "#{key} #{value}" }