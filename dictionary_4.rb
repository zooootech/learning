# p 人のグループ A , q 人のグループ B , r 人のグループ C があります。
# 各グループのメンバーにはそれぞれ番号がつけられており、 A グループの i 番目の人は B グループの j 番目の人に仕事を任せ、 B グループの j 番目の人は与えられた仕事を C グループの k 番目の人に任せます。すると結局、 A グループの i 番目の人の仕事をするのは C グループの k 番目の人だということになります。
# A グループの人のそれぞれが最終的に C グループの誰に仕事を頼むことになるのかを、 A グループの人の番号が小さい順に p 行出力してください。


# 入力される値
## 入力は以下のフォーマットで与えられます。

## p q r
## i_1 j_1
## ...
## i_p j_p
## j'_1 k_1
## ...
## j'_q k_q

## 1 行目には A グループ、 B グループ、 C グループのそれぞれの人数 p , q , r が半角スペース区切りで与えられます。
## 2 行目から (p + 1) 行目までは A グループの人の番号とその人が仕事を頼む B グループの人の番号 i_a, j_a （1 ≤ a ≤ p） が半角スペース区切りで、 (p + 2) 行目から (p + q + 2) 行目までは B グループの人の番号とその人が仕事を頼む C グループの人の番号 j’_b , k_b （1 ≤ b ≤ q） が半角スペース区切りで与えられます。

## 入力値最終行の末尾に改行が１つ入ります。
## 文字列は標準入力から渡されます。


# 期待する出力
## A グループの i_c 番目の人が C グループの k_c 番目の人に仕事を頼むとしたとき （1 ≤ c ≤ p） 、各 i_c, k_c をそれぞれ半角スペース区切りで、 i_c が小さい順に p 行出力してください。
## 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
## すべてのテストケースにおいて、以下の条件をみたします。

## ・1 ≤ p , q , r ≤ 50
## ・1 ≤ i_a ≤ p , 1 ≤ j_a , j'_b ≤ q , 1 ≤ k_b ≤ r （1 ≤ a ≤ p , 1 ≤ b ≤ q）
## ・各 i_a は全て異なる
## ・各 j'_b は全て異なる

## A グループから仕事を頼まれた B グループの人は必ずその仕事を C グループの誰かに頼みます。 B グループに関する入力には「余計な」ものも含まれます。すなわち、 A グループの誰からも仕事を頼まれていない B グループの人に関して、その人が C グループの誰に仕事を頼むかについての情報が与えられることもあります。


# 入力例1
## 2 2 2
## 2 1
## 1 2
## 1 1
## 2 2

# 出力例1
## 1 2
## 2 1

# 入力例2
## 2 3 4
## 1 3
## 2 1
## 2 3
## 3 3
## 1 4

# 出力例2
## 1 3
## 2 4

# -------------------------------------------------

# 与えられる値をハッシュに格納する

counts = gets.chomp.split
count_a = counts[0].to_i
count_b = counts[1].to_i
count_c = counts[2].to_i

group_ab = {}

for i in 1..count_a
    ab = gets.chomp.split
    group_ab[ab[0]] = ab[1]
end

group_bc = {}

for i in 1..count_b
    bc = gets.chomp.split
    group_bc[bc[0]] = bc[1]
end

group_ac = {}

group_ab.each do |a1, b1|
    group_bc.each do |b2, c2|
        if b1 == b2
            group_ac[a1] = c2
        end
    end
end

group_ac.sort_by {|a, c| a.to_i}.each do |ac|
    puts "#{ac[0]} #{ac[1]}"
end

# -------------------------------------------------

# 与えられる値を配列に格納する

counts = gets.chomp.split
count_a = counts[0].to_i
count_b = counts[1].to_i
count_c = counts[2].to_i

group_ab = []

for i in 1..count_a
    ab = gets.chomp.split
    group_ab << ab
end

group_bc = []

for i in 1..count_b
    bc = gets.chomp.split
    group_bc << bc
end

group_ac = []

group_ab.each do |ab|
    group_bc.each do |bc|
        if ab[1] == bc[0]
            group_ac << [ab[0], bc[1]]
        end
    end
end

group_ac.sort_by {|a| a[0].to_i}.each do |ac|
    puts "#{ac[0]} #{ac[1]}"
end