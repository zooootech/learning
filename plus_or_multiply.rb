# 2つの整数の組がn個与えられるので、各組の計算結果を足し合わせたものを出力してください。
# 各組の計算結果は次の値です。
# ・2つの整数の組を足し合わせたもの
# ・ただし、2つの整数が同じ値だった場合は、掛け合わせたもの


# 入力される値
# 入力は以下のフォーマットで与えられます。

# n
# a_1 b_1
# ...
# a_n b_n

# nは与えられる整数の組の行数です。
# a_iとb_iはそれぞれが整数です。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください


# 期待する出力
# 各行の計算結果を足し合わせた値を出力してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件を満たします。

# 1 ≦ n ≦ 50
# -100,000 ≦ a_n ≦ 100,000
# -100,000 ≦ b_n ≦ 100,000


# 入力例1
# 5
# 2 1
# 3 6
# 4 2
# 4 4
# 4 70

# 出力例1
# 108

# 入力例2
# 1
# 0 0

# 出力例2
# 0

# 入力例3
# 3
# 1 2
# 3 4
# 5 6

# 出力例3
# 21


count = gets.to_i

numbers = []

for i in 1..count
    number = gets.chomp.split
    numbers << number
end

sum = 0

numbers.each do |number|
    if number[0] == number[1]
        sum += number[0].to_i * number[1].to_i
    else
        sum += number[0].to_i + number[1].to_i
    end
end

puts sum