# スペースで区切られた英単語列が与えられます。
# 英単語列に含まれる英単語の出現回数を出現した順番に出力してください。


# 入力される値
# 半角スペースで区切られた長さNの文字列
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 単語、半角スペース、出現回数の順で１行に１単語で出現したすべての単語を、列に出現する順に出力してください。


# 条件
# 全てのテストケースにおいて以下の条件を満たします。

# 1 ≦ N ≦ 1,000


# 入力例1
# red green blue blue green blue

# 出力例1
# red 1
# green 2
# blue 3

# 入力例2
# Apple Apricot Orange Cherry Apple Orange Cherry Orange

# 出力例2
# Apple 2
# Apricot 1
# Orange 3
# Cherry 2


array1 = gets.chomp.split()  # 標準入力から読み込んだデータを半角スペース区切りで分割し、それらを要素に持つ配列を生成し、変数に代入
array2 = array1.uniq  # 配列に格納されている要素の中で同じ要素を取り除いた新しい配列を生成し、変数に代入

array2.each do |word|  # array2 に格納されている要素を一つずつ取り出して、ブロック変数 word に代入
  count = array1.count(word)  # array1 に、 word と同じ要素がいくつあるかをカウントし、変数に代入
  puts "#{word} #{count}"
end

# -------------------------------------------------

words = gets.chomp.split

now_word = 0  # 添字に利用

while words.size != 0  # 配列 words の要素がなくなるまで繰り返し処理を行う
  puts "#{words[now_word]} #{words.count(words[now_word])}"
  words.delete(words[now_word])
end