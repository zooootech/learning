# n 人の人に関して、それぞれの人の名前と財産が与えられます。その後に人名 S が与えられるので （S は最初に与えられた名前のうちのいずれか） 、 S の財産を表す整数を出力してください。


# 入力される値
## 入力は以下のフォーマットで与えられます。

## n
## s_1 a_1
## ...
## s_n a_n
## S

## 1 行目には正整数nが与えられ、 2 行目から (n + 1) 行目には、人々の名前と財産が “s_i a_i” というフォーマット （s_i は人の名前を表す文字列、 a_i はその人の財産を表す整数、半角スペース区切り）で与えられます。 (n + 2) 行目には人名 S が与えられます (S は 2 行目から (n + 1) 行目にかけて与えられた人名のいずれか）。

## 入力値最終行の末尾に改行が１つ入ります。
## 文字列は標準入力から渡されます。


# 期待する出力
## S の財産を出力してください。
## 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
## すべてのテストケースにおいて、以下の条件をみたします。

## ・1 ≤ n , a_i ≤ 50 （1 ≤ i ≤ n）
## ・各 s_i （1 ≤ i ≤ n） および S は大小アルファベットからなる長さ 1 以上 10 以下の文字列


# 入力例1
## 2
## Kirishima 1
## Kyoko 2
## Kirishima

# 出力例1
## 1

# 入力例2
## 3
## paiiza 2
## paiza 1
## paiiiza 3
## paiiiza

# 出力例2
## 3

# -------------------------------------------------

# 配列を作成後、それに要素を追加し、2次元配列を作成し、それに対しeachを用いて検証

count = gets.to_i

elements = []

for i in 1..count
    line = gets.chomp.split
    elements << line
end

name = gets.chomp

elements.each do |element|
    if element[0] == name
        puts element[1]
    end
end

# -------------------------------------------------

# 配列を作成後、それに要素を追加し、2次元配列を作成し、それをハッシュ形式に変換し、eachを用いて検証

count = gets.to_i

elements = []

for i in 1..count
    line = gets.chomp.split
    elements << line
end

name = gets.chomp

elements.to_h.each do |n, p|
    if n == name
        puts p
    end
end

# -------------------------------------------------

# 初めからハッシュを作成し、それに要素を追加し、eachを用いて検証

count = gets.to_i

elements = {}

for i in 1..count
    line = gets.chomp.split
    elements[line[0]] = line[1]
end

name = gets.chomp

elements.each do |n, p|
    if n == name
        puts p
    end
end