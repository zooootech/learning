# 忘年会の余興で次のようなゲームを行います。まず、正整数 M が発表され、参加者は手元の紙に M 個、好きな数字を書きます。
# このとき、紙に書く数のそれぞれは 1 以上 M 以下であり、同じ数字を何度書いても構いません。その後、 1 以上 M 以下の数 K が発表され、各参加者は自分の紙に数字 K を書いた数だけポイントをもらい、ポイントの高い順に景品が配られます。
# 忘年会の参加者の人数 N と、数 M , K が与えられ、各参加者が書いた紙が与えられるので、それぞれの参加者の得点を計算して出力してください。


# 入力される値
## 入力は以下のフォーマットで与えられます。

## N M K
## a_{1,1} ... a_{1,M}
## ...
## a_{N,1} ... a_{N,M}

## 1 行目には上で説明した数 N, M, K が半角スペース区切りで与えられ、 2 行目から (N + 1) 行目までには各参加者が紙に書いた数字が M 個ずつ半角スペース区切りで、 N 回与えられます。

## 入力値最終行の末尾に改行が１つ入ります。
## 文字列は標準入力から渡されます。


# 期待する出力
## 入力された通りの順番で、各参加者の得点をN回、改行区切りで出力してください。
## 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
## すべてのテストケースにおいて、以下の条件をみたします。

## ・1 ≤ N , M ≤ 50
## ・1 ≤ K , a_{i,j} ≤ M（1 ≤ i ≤ N , 1 ≤ j ≤ M）


# 入力例1
## 3 2 1
## 2 2
## 1 2
## 1 1

# 出力例1
## 0
## 1
## 2

# 入力例2
## 4 5 2
## 1 3 4 4 5
## 2 2 2 2 2
## 1 2 3 4 5
## 1 1 1 1 1

# 出力例2
## 0
## 5
## 1
## 0

# -------------------------------------------------

# 数値を受け取る度に、forループを用いて検証

line = gets.chomp.split
people = line[0].to_i
count = line[1].to_i
hit_number = line[2].to_i

for i in 1..people
    numbers = gets.chomp.split
    point = 0
    for i in 0..(count - 1)
        if numbers[i].to_i == hit_number
            point += 1
        end
    end
    puts point
end

# -------------------------------------------------

# 受け取った数値を一度全て配列に格納し、eachで取り出して検証

line = gets.chomp.split
people = line[0].to_i
count = line[1].to_i
hit_number = line[2].to_i

numbers = []

for i in 1..people
    number = gets.chomp.split
    numbers.push(number)
end

numbers.each do |number|
    point = 0
    number.each do |num|
        if num.to_i == hit_number
            point += 1
        end
    end
    puts point
end