# 5行5列の五目並べの盤面が与えられます。
# 盤面の各マスには、"O"か"X"か"."が書かれています。
# "O"と"X"は、それぞれプレイヤーの記号を表します。
# 同じ記号が斜めに連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。
# 勝者の記号を1行で表示してください。
# 勝者がいない場合は、引き分けとして、"D"を表示してください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# s_1
# s_2
# s_3
# s_4
# s_5

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 勝者の記号を1行で表示してください。
# 勝者がいない場合は、引き分けとして、"D"を表示してください。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・s_iの文字数は5文字
# ・s_iに含まれる文字は"O"か"X"か"."のいずれか
# ・勝者が2人になる盤面が与えられることはありません


# 入力例1
# XXOXO
# OXOXX
# OOOOO
# OXOX.
# XOXXO

# 出力例1
# D

# 入力例2
# XXOXO
# OXOXX
# .OXXO
# OXOO.
# XXXXX

# 出力例2
# D

# 入力例3
# ...X.
# ...X.
# ...X.
# ...X.
# OOOO.

# 出力例3
# D


string = []
5.times do
  string << gets.chomp.split("")
end

array = %w(O X)
result = "D"

array.each do |a|
  count = 0
  5.times do |i|
    if a == string[i][i]
      count += 1
    end
  end

  if count == 5
    result = a
    break
  else
    count = 0
    5.times do |i|
      if a == string[i][-(i + 1)]
        count += 1
      end
    end

    if count == 5
      result = a
      break
    end
  end
end

puts result