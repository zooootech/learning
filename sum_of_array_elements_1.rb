# 指定した配列（リスト）を定義し、配列（リスト）の要素すべてを加算して出力してください。


# 入力される値
# なし

# 1, 3, 5, 6, 3, 2, 5, 23, 2
# を要素に持つ配列（リスト）をプログラムで定義し、使用すること。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 配列（リスト）の要素すべてを足した値。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# なし

# -------------------------------------------------

numbers = [1, 3, 5, 6, 3, 2, 5, 23, 2]

puts numbers.sum

# -------------------------------------------------

numbers = [1, 3, 5, 6, 3, 2, 5, 23, 2]

sum = 0

numbers.each do |i|
  sum += i
end

puts sum