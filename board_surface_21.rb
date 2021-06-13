# 陣取りの手間 (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_camp_step4

# 幅優先探索の繰り返しに、注目しているマスに書かれた数を引数 n として受け取ることで、 新たに陣地となるマスに数 n+1 を書き込むことができます。
# 入れる値が 3 つの FIFOのデータ構造を用いて幅優先探索を行います。 各言語で工夫して連想配列を用いて実装をしてください。

# 初めにスタート地点の座標と操作回数（1 からスタート）をキューに入れ、隣接する移動可能なマスの座標と、操作回数 + 1 をqueueに入れます。 例. 上下左右のマスに移動可能な場合、（移動可能なマスの座標を 1, 2, 3, 4 と表現し、(マスの座標, 操作回数)として、配列に追加する） queue の先頭 ← (1, 1 + 1), (2, 1 + 1), (3, 1 + 1), (4, 1 + 1) → queue の末尾
# queue からマスを １ つ取り出し、まだ陣地でない部分を新たに陣地にします。 例. マス 1 から移動可能なマスが 3 つの場合、（移動可能なマスの座標を 5, 6, 7 と表現する） queue の先頭 ← (2, 1 + 1), (3, 1 + 1), (4, 1 + 1), (5, 2 + 1), (6, 2 + 1), (7, 2 + 1) → queue の末尾

h, w = gets.chomp.split.map(&:to_i)

array = []

for i in 1..h
  array << gets.chomp
end

# このコードでは my_p をキューとして使います。
my_p = []

# まず最初にスタート位置の * を 0 に書き換え、座標と操作回数を my_p に追加します。
for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "*"
      array[y][x] = "0"
      my_p.push([y, x, 1])
    end
  end
end

# my_p から座標と操作回数を取り出し、上下左右を確認し移動出来るようならマスを操作回数に書き換え、移動先の座標と 1 増やした操作回数を my_p に追加します。
# この処理を my_p の中身が空になるまでループします。

while my_p.size != 0  # 配列 my_p の要素がなくなるまで繰り返し処理を行う
  # 配列.delete_at(pos)で、指定された位置 pos にある要素を取り除きそれを返します。 pos が範囲外であったら nil を返します。
  # Array#at と同様に負のインデックスで末尾から位置を指定することができます。
  # 二次元配列 my_p からインデックス（添字）が 0 の要素 を取り除き、その要素（3 つの要素を持つ配列）の要素をそれぞれ x, y, n に代入する
  y, x, n = my_p.delete_at(0)

  if 0 < y && array[y - 1][x] == "."
    array[y - 1][x] = n.to_s
    my_p.push([y - 1, x, n + 1])
  end
  if y < h - 1 && array[y + 1][x] == "."
    array[y + 1][x] = n.to_s
    my_p.push([y + 1, x, n + 1])
  end
  if 0 < x && array[y][x - 1] == "."
    array[y][x - 1] = n.to_s
    my_p.push([y, x - 1, n + 1])
  end
  if x < w - 1 && array[y][x + 1] == "."
    array[y][x + 1] = n.to_s
    my_p.push([y, x + 1, n + 1])
  end
end

array.each do |row|
  puts row
end

# -------------------------------------------------

# 以下、誤回答

# h, w = gets.chomp.split.map(&:to_i)

# array = []

# for i in 1..h
#   array << gets.chomp
# end

# my_p = []

# for y in 0..(h - 1)
#   for x in 0..(w - 1)
#     if array[y][x] == "*"
#       my_p.push([y, x])  # 最初の位置を配列 my_p に追加
#       array[y][x] = "0"
#     end
#   end
# end

# y, x = my_p.delete_at(0)

# coordinates = []
# coordinate_index = 0

# i = 1
# while true

#   if 0 < y && array[y - 1][x] == "."
#     array[y - 1][x] = i.to_s
#     coordinates.push([y - 1, x])
#   end
#   if y < h - 1 && array[y + 1][x] == "."
#     array[y + 1][x] = i.to_s
#     coordinates.push([y + 1, x])
#   end
#   if 0 < x && array[y][x - 1] == "."
#     array[y][x - 1] = i.to_s
#     coordinates.push([y, x - 1])
#   end
#   if x < w - 1 && array[y][x + 1] == "."
#     array[y][x + 1] = i.to_s
#     coordinates.push([y, x + 1])
#   end

#   cl = coordinates.length

#   if coordinates.size != 0
#     my_p.push(coordinates.slice!(0, coordinates.length))
#   end

#   if my_p[0].size == 0
#     my_p.delete_at(0)
#     if my_p.size == 0
#       flag_out = true
#     end
#     if cl != 0
#       i += 1
#     end
#   end

#   if i == 1
#     i += 1
#   end

#   break if flag_out

#   y, x = my_p[0].delete_at(0)

# end

# array.each do |row|
#   puts row
# end