# 指定された配列（リスト）の定義の中で、同じ値が存在した場合はtrueを、そうでない場合はfalseを出力してください。


# 入力される値
# なし

# HND, NRT, KIX, NGO, NGO
# を要素に持つ配列（リスト）をプログラムで定義し、使用すること。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 配列（リスト）の要素に重複があればtrueを、重複がなかったらfalseを出力する。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# なし

# -------------------------------------------------

array = ["HND", "NRT", "KIX", "NGO", "NGO"]

result = 0
array.each do |a|
    array.each do |b|
        if a == b
            result += 1
        end
    end
end

if result >= 1
    puts "true"
else
    puts "false"
end

# -------------------------------------------------

array = %w(HND NRT KIX NGO NGO)

is_duplicate = false

array.size.times do |i|
  array.size.times do |j|
    is_duplicate = true if i != j and array[i] == array[j]
  end
end

puts is_duplicate

# -------------------------------------------------

array = %w(HND NRT KIX NGO NGO)

# uniqは配列から重複した要素を取り除いた新しい配列を返す
puts array.size != array.uniq.size