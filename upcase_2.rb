# スペース区切りの2つの整数と、文字列が入力されます。2つの整数の範囲の部分文字列を、大文字にして出力してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# a b
# s

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 文字列 s の a 文字目から b 文字目を大文字にして、文字列 s を出力してください。
# 文字列 s に含まれる記号やスペースは、変形せずそのまま出力します。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# 1 ≦ a ≦ b ≦ (文字列 s の長さ) ≦ 100

# 文字列 s は、半角英数字・半角記号スペースで構成されます。


# 入力例1
# 2 6
# this is a pen

# 出力例1
# tHIS Is a pen

# 入力例2
# 2 6
# Welcome to the paiza! I`m studying ruby!

# 出力例2
# WELCOMe to the paiza! I`m studying ruby!

# 入力例3
# 1 10
# Welcome to the paiza! I`m studying ruby!

# 出力例3
# WELCOME TO the paiza! I`m studying ruby!

# -------------------------------------------------

numbers = gets.chomp.split

a = numbers[0].to_i - 1
b = numbers[1].to_i

str1 = gets.chomp.split("")

turn = 0


str1.each do |str|
    if a <= turn && turn < b 
        print str.upcase
    else
        print str
    end
    turn += 1
end

# -------------------------------------------------

nums = gets.chomp.split(' ')
str = gets.chomp

(1..(str.size)).each do |i|
  if nums[0].to_i <= i && i <= nums[1].to_i
    print str[i - 1].upcase
  else
    print str[i - 1]
  end
end

print "\n"