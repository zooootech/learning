# 1行5列の五目並べの盤面が与えられます。
# 盤面の各マスには、"O"か"X"か"."が書かれています。
# "O"と"X"は、それぞれプレイヤーの記号を表します。
# 同じ記号が横に連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。
# 勝者の記号を1行で表示してください。
# 勝者がいない場合は、引き分けとして、"D"を表示してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# s

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
## 勝者の記号を1行で表示してください。
## 勝者がいない場合は、引き分けとして、"D"を表示してください。


# 条件
## すべてのテストケースにおいて、以下の条件をみたします。

## ・sの文字数は5文字
## ・sに含まれる文字は"O"か"X"か"."のいずれか
## ・勝者が2人になる盤面が、与えられることはありません。


# 入力例1
## OOOOO

# 出力例1
## O

# 入力例2
## OXOOO

# 出力例2
## D

# 入力例3
## ...O.

# 出力例3
## D


line = gets.chomp.split("")  # split("")で、文字列を1文字ずつ分割する

p line

if (line[0] == "O" || line[0] == "X") && (line[0] == line[1] && line[1] == line[2] && line[2] == line[3] && line[3] == line[4])
    puts line[0]
else
    puts "D"
end

# -------------------------------------------------

array = ["O", "X"]
string = gets.chomp.split('')
result = 'D'

array.each do |a|
  cnt = 0
  string.each do |s|
    if s == a
      cnt = cnt + 1
    end
    if cnt >= 5
      result = a
    end
  end
end

puts result

# 以下のように書き直せる

array = %w[O X]  # %記法を用いる
string = gets.chomp.split('')
result = 'D'

array.each do |a|
  cnt = 0
  string.each { |s| cnt = cnt + 1 if s == a }  # 後置ifを用いる
  result = a if cnt >= 5  # 後置ifを用いる
end

puts result