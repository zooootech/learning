# 指定された配列（リスト）の定義の中で、同じ要素の数をカウントして、その数を出力してください。


# 入力される値
# なし

# "HND", "NRT", "KIX", "NGO", "NGO", "NGO", "NGO", "NGO"
# を要素に持つ配列（リスト）をプログラムで定義し、使用すること。
# ただし、2つ以上同じ要素が出現するのは、1種類の文字列についてだけです。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 同じ要素の数をカウントして、その数を出力してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# なし

# -------------------------------------------------

array = %w[HND NRT KIX NGO NGO NGO NGO NGO]
count = {}

array.each do |element|
  if count[element]
    count[element] = count[element] + 1
  else
    count[element] = 1
  end
end

count.each { |key, value| puts value if value != 1 }

# -------------------------------------------------

array = ["HND", "NRT", "KIX", "NGO", "NGO", "NGO", "NGO", "NGO"]

puts array.size - array.uniq.size + 1