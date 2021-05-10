# マップの行数 H と列数 W ,障害物を # で、移動可能な場所を . で表したH行W列のマップ S_1 ... S_H が与えられます。
# 続けて現在の座標 sy , sx ,１マス移動する方角 m が与えられるので、移動が可能かどうかを判定してください。
# 移動可能であるということは、以下の図の通り「移動先が障害物でない　かつ　移動先がマップの範囲外でない」ということを意味します。
# なお、マスの座標系は左上端のマスの座標を ( y , x ) = ( 0 , 0 ) とし、
# 下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。


# 入力される値
# H W sy sx m     
# S_0    
# ...     
# S_(H-1)

# ・ 1 行目には盤面の行数を表す整数 H , 盤面の列数を表す整数 W , 現在の y, x 座標を表す sy sx , 1 マス移動する方角 m が与えられます。
# ・ 続く H 行のうち i 行目 (0 ≦ i < H) には、盤面の i 行目の文字をまとめた文字列 S_i が与えられ、 S_i の j 文字目は、盤面の i 行目の j 列目に書かれている文字を表します。(0 ≦ j < W)

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 移動が可能である場合 "Yes" を、不可能である場合 "No" を出力してください。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・ 1 ≦ H, W ≦ 20
# ・ 0 ≦ sy < H , 0 ≦ sx < W
# ・ S_i は W 文字の文字列
# ・ マップ上の(sy, sx)のマスは必ず '.'
# ・ S の各文字は '.' または '#'
# ・ m は、N, S, E, W のいずれかであり、それぞれ 北・南・東・西 を意味します。


# 入力例1
# 3 3 1 1 E
# ..#
# ..#
# ...

# 出力例1
# No

# 入力例2
# 9 2 4 0 S
# #.
# #.
# ..
# ##
# ..
# ..
# .#
# ..
# .#

# 出力例2
# Yes


h, w, y, x, m = gets.chomp.split

h = h.to_i
w = w.to_i
y = y.to_i
x = x.to_i

judge = "Yes"

array = []

for i in 1..h
  array << gets.chomp
end

if (m == "N" && y == 0) || (m == "E" && x == (w - 1)) || (m == "S" && y == (h - 1)) || (m == "W" && x == 0)
  judge = "No"
elsif m == "N"
  y -= 1
  if array[y][x] == "#"
    judge = "No"
  end
elsif m == "E"
  x += 1
  if array[y][x] == "#"
    judge = "No"
  end
elsif m == "S"
  y += 1
  if array[y][x] == "#"
    judge = "No"
  end
elsif m == "W"
  x -= 1
  if array[y][x] == "#"
    judge = "No"
  end
end

puts judge

# -------------------------------------------------

h, w, y, x, m = gets.chomp.split

h = h.to_i
w = w.to_i
y = y.to_i
x = x.to_i

array = []

for i in 1..h
  array << gets.chomp
end

def judgment_of_movement(h, w, x, y, m, array)
    
  judge = "Yes"

  if (m == "N" && y == 0) || (m == "E" && x == (w - 1)) || (m == "S" && y == (h - 1)) || (m == "W" && x == 0)
    judge = "No"
    return judge
  end

  if m == "N"
    y -= 1
  elsif m == "E"
    x += 1
  elsif m == "S"
    y += 1
  elsif m == "W"
    x -= 1
  end

  if array[y][x] == "#"
    judge = "No"
  end
  
  return judge

end

puts judgment_of_movement(h, w, x, y, m, array)

# -------------------------------------------------

h, w, y, x, m = gets.chomp.split

h = h.to_i
w = w.to_i
y = y.to_i
x = x.to_i

judge = "Yes"

array = []

for i in 1..h
  array << gets.chomp
end

if (m == "N" && y == 0) || (m == "E" && x == (w - 1)) || (m == "S" && y == (h - 1)) || (m == "W" && x == 0)
  judge = "No"
end

if m == "N"
  y -= 1
elsif m == "E"
  x += 1
elsif m == "S"
  y += 1
elsif m == "W"
  x -= 1
end

if array[y][x] == "#"
  judge = "No"
end

puts judge