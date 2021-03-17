# 5行5列の五目並べの盤面が与えられます。
# 盤面の各マスには、"O"か"X"か"."が書かれています。
# "O"と"X"は、それぞれプレイヤーの記号を表します。
# 同じ記号が横に連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。
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
# ・勝者が2人になる盤面が、与えられることはありません。


# 入力例1
# XXOXO
# OXOXX
# OOOOO
# OXOX.
# XOXXO

# 出力例1
# O

# 入力例2
# XXOXO
# OXOXX
# .OXXO
# OXOO.
# XXXXX

# 出力例2
# X

# 入力例3
# O.O.X
# OXX.X
# O.X.X
# OO..X
# X.XOX

# 出力例3
# D


array = []
while line = gets
  array << line.chomp
end

turn = 0

array.each do |elements|
  result = 0
  (elements.length - 1).times do |i|
    if elements[i] == elements[i + 1]
      result += 1
    end
  end

  if result == 4
    puts elements[0]
    break
  end
  turn += 1
end

if turn == array.length
  puts "D"
end

# -------------------------------------------------

array = %w[O X]
result = 'D'

(1..5).each do
  string = gets.chomp.split('')

  array.each do |a|
    cnt = 0
    string.each { |s| cnt = cnt + 1 if s == a }
    result = a if cnt >= 5
  end
end

puts result