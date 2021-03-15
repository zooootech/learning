# スペース区切りで2つの整数が入力されるので、その区間の整数を全て表示してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# a b

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# a 以上 b 以下の間の全ての整数を、改行区切りで表示してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件を満たします。

# 0 ≦ a ≦ b ≦ 100


# 入力例1
# 0 10

# 出力例1
# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

# 入力例2
# 5 10

# 出力例2
# 5
# 6
# 7
# 8
# 9
# 10

# 入力例3
# 3 3

# 出力例3
# 3


numbers = gets.chomp.split

numbers.map! do |number|
    number.to_i
end

a = numbers[0]
b = numbers[1]

for i in a..b
    puts i
    i += 1
end