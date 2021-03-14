# m 個の文字 c_1, ..., c_m と、 n 個の文字列 S_1, ..., S_n が与えられます。
# 各 c_i （1 ≤ i ≤ m） について、各 S_j （1 ≤ j ≤ n） に c_i が出現するかをそれぞれ調べ、出現する場合は "YES" を、そうでない場合には "NO" を、そのつど出力してください。


# 入力される値
## 入力は以下のフォーマットで与えられます。

## m
## c_1
## ...
## c_m
## n
## S_1
## ...
## S_n

## 1 行目に正整数 m が、 2 行目から (m + 1) 行目では文字 c_1, ...,c_m が、 (m + 2) 行目に正整数 n が、 (m + 3) 行目から ( m + n + 2) 行目では文字列 S_1, ..., S_n が、それぞれ改行区切りで与えられます（入力は全部で (m + n + 2) 行）。

## 入力値最終行の末尾に改行が１つ入ります。
## 文字列は標準入力から渡されます。


# 期待する出力
## c_1 が S_1 に出現するかどうか、 c_1 が S_2 に出現するかどうか、 ... 、 c_1 が S_n に出現するかどうか、 c_2 が S_1 に出現するかどうか、 c_2 が S_2 に出現するかどうか、 ... 、 c_2 が S_n に出現するかどうか、 ... 、 c_m が S_1 に出現するかどうか、 c_m が S_2 に出現するかどうか、 ... 、 c_m が S_n に出現するかどうか、という順番で m * n 回出力してください。
## 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
## すべてのテストケースにおいて、以下の条件をみたします。

## ・1 ≤ m, n ≤ 50
## ・各 c_i, S_j (1 ≤ i ≤ m, 1 ≤ j ≤ n） はそれぞれアルファベット大文字あるいは小文字からなる文字、文字列
## ・各 S_j （1 ≤ j ≤ n） の長さは 1 以上 10 以下


# 入力例1
## 1
## a
## 2
## paiza
## kyoko

# 出力例1
## YES
## NO

# 入力例2
## 2
## c
## d
## 2
## cat
## dog

# 出力例2
## YES
## NO
## NO
## YES


count1 = gets.to_i

strings1 = []
for i in 1..count1
    string1 = gets.chomp
    strings1.push(string1)
end

count2 = gets.to_i

strings2 = []
for i in 1..count2
    string2 = gets.chomp
    strings2.push(string2)
end


strings1.each do |str1|
    strings2.each do |str2|
        if str2.include?(str1)
            puts "YES"
        else
            puts "NO"
        end
    end
end