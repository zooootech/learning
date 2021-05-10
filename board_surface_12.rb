# マップの行数 H と列数 W ,障害物を # ,移動可能な場所を . で表した H 行 W 列のマップ S_1 ... S_H が与えられます。
# 続けて現在の座標 sy , sx ,現在向いている方角 d ,１マス移動する方向 m が与えられるので、移動が可能かどうかを判定してください。
# 移動可能であるということは、以下の図の通り 「移動先が障害物でない かつ 移動先がマップの範囲外でない」 ということを意味します。
# なお、マスの座標系は左上端のマスの座標を ( y , x ) = ( 0 , 0 ) とし、
# 下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。


# 入力される値
# H W sy sx d m      
# S_0     
# ...     
# S_(H-1)

# ・ 1 行目には盤面の行数を表す整数 H , 盤面の列数を表す整数 W , 現在の y, x 座標を表す sy sx , 現在向いている方角 d , 1 マス移動する方向 m が与えられます。
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
# ・ d は、 N, S, E, W のいずれかであり、それぞれ 北・南・東・西 を意味します。
# ・ m は、 L, R のいずれかであり、それぞれ 左・右 を意味します。


# 入力例1
# 2 6 0 4 E L
# ####..
# ##..#.

# 出力例1
# No

# 入力例2
# 7 9 6 0 S R
# ..#.#..##
# ..#..#...
# #.......#
# #.#...###
# #.##....#
# .....#...
# ..##..#.#

# 出力例2
# No

# -------------------------------------------------

# 移動が可能かどうかの各条件は次のような処理に言い換えられます。
# 「移動先が障害物でない」→ map[移動後のy座標][移動後のx座標]!='#'
# 「移動先がマップの範囲外でない」 → 0<=移動後のy座標 && 移動後のy座標<H && 0<=移動後のx座標 && 移動後のx座標<W
# これらを全て満たした場合、座標を出力するコードを書きます。

# 配列 directions と、カウント変数 now で移動方向の管理をしています。
# 入力された方向が R ならば移動方向を 1 増やし、 L ならば移動方向を 3 増やします。( 1 減らすでも問題ありません)
# if 文を用いて判定し座標を更新し、更新先が移動出来るかを判定します。

h, w, y, x, d, m = gets.chomp.split

h = h.to_i
w = w.to_i
y = y.to_i
x = x.to_i

array = []

for i in 1..h
  array << gets.chomp
end

directions = ["N", "E", "S", "W"]

# 配列.index(val) で、val に一致する最初の要素の位置を返します
now = directions.index(d)

if m == "L"
  now = (now + 3) % 4
else
  now = (now + 1) % 4
end

if directions[now] == "N"
  y -= 1
elsif directions[now] == "E"
  x += 1
elsif directions[now] == "S"
  y += 1
elsif directions[now] == "W"
  x -= 1
end

if (0 <= y && y <= (h - 1)) && (0 <= x && x <= (w - 1)) && array[y][x] == "."
  puts "Yes"
else
  puts "No"
end

# -------------------------------------------------

h, w, y, x, d, m = gets.chomp.split

h = h.to_i
w = w.to_i
y = y.to_i
x = x.to_i

array = []

for i in 1..h
  array << gets.chomp
end

directions = ["N", "E", "S", "W"]

# 配列.index(val) で、val に一致する最初の要素の位置を返す
now = directions.index(d)

if m == "L"
  now = (now + 3) % 4
else
  now = (now + 1) % 4
end

if directions[now] == "N"
  y -= 1
elsif directions[now] == "E"
  x += 1
elsif directions[now] == "S"
  y += 1
elsif directions[now] == "W"
  x -= 1
end

if (y <= 0 || (h - 1) <= y) || (x <= 0 && (w - 1) <= x) || array[y][x] == "#"
  puts "No"
else
  puts "Yes"
end

# -------------------------------------------------

h, w, y, x, d, m = gets.chomp.split

h = h.to_i
w = w.to_i
y = y.to_i
x = x.to_i

judge = "Yes"

array = []

for i in 1..h
  array << gets.chomp
end

if d == "N"
  if (x == 0 && m == "L") || (x == (w - 1) && m == "R")
    judge = "No"
  end
elsif d == "E"
  if (y == 0 && m == "L") || (y == (w - 1) && m == "R")
    judge = "No"
  end
elsif d == "S"
  if (x == 0 && m == "R") || (x == (w - 1) && m == "L")
    judge = "No"
  end
elsif d == "W"
  if (y == 0 && m == "R") || (y == (w - 1) && m == "L")
    judge = "No"
  end
end

if d == "N"
  if m == "L"
    x -= 1
  elsif m == "R"
    x += 1
  end
elsif d == "E"
  if m == "L"
    y -= 1
  elsif m == "R"
    y += 1
  end
elsif d == "S"
  if m == "L"
    x += 1
  elsif m == "R"
    x -= 1
  end
elsif d == "W"
  if m == "L"
    y += 1
  elsif m == "R"
    y -= 1
  end
end

if array[y][x] == "#"
  judge = "No"
end

puts judge