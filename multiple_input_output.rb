# 改行区切りで自然数が n 個入力されるので、n 個の自然数をそのまま出力してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# n
# a_1
# a_2
# a_3
# ...
# a_n

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 入力されたそれぞれの自然数 a_i を、そのまま出力してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# 1 ≦ n ≦ 3,000
# 1 ≦ a_i ≦ 100,000


# 入力例1
# 1
# 54

# 出力例1
# 54

# 入力例2
# 4
# 382
# 695
# 928
# 577

# 出力例2
# 382
# 695
# 928
# 577

# 入力例3
# 5
# 856
# 246
# 368
# 346
# 336

# 出力例3
# 856
# 246
# 368
# 346
# 336

# -------------------------------------------------

count = gets.to_i

for i in 1..count
    number = gets.to_i
    puts number
end

# -------------------------------------------------

count = gets.to_i

count.times do
    number = gets.to_i
    puts number
end

# -------------------------------------------------

count = gets.to_i

while number = gets
    puts number.to_i
end