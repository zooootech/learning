# 開始時点の x , y 座標,移動の回数 N が与えられます。
# 続くN行で移動の向き d1 ... dN が与えられるので、与えられた順に移動をしたときの各移動後の x , y 座標 を答えてください。
# 移動者ははじめ北を向いています。
# なお、マスの座標系は下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。
# 移動をするごとに向く方角が変わること・移動前に向いている方角によって同じ移動の向きでも座標の変化が違うことに気をつけてください。
# 例えば、上の図の状態から右に移動を行った場合、下の図のような状態になります。


# 入力される値
# X Y N       
# d1      
# ...     
# dN

# ・ 1 行目には、開始時点の x , y 座標を表す X , Y, 移動の回数 N が与えられます。
# ・ 続く N 行 (1 ≦ i ≦ N) には、盤面の i 回目の移動の向きを表す文字 d_i が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# N 行での出力
# ・ 各移動後の x , y 座標を出力してください。

# x_1 y_1
# ...
# x_N y_N


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。
# ・ -100 ≦ X, Y ≦ 100
# ・ 1 ≦ N ≦ 100
# ・ d は、L, R のいずれかでそれぞれ 左・右 に １ マス進むことを表す。


# 入力例1
# 3 5 1
# L

# 出力例1
# 2 5

# 入力例2
# -18 45 6
# L
# L
# R
# R
# L
# R

# 出力例2
# -19 45
# -19 46
# -20 46
# -20 45
# -21 45
# -21 44


x, y, n = gets.chomp.split.map(&:to_i)

directions = ["N", "E", "S", "W"]
now_direction = 0

for i in 1..n
  d = gets.chomp
  
  if d == "L"
    now_direction = (now_direction + 3) % 4
  else
    now_direction = (now_direction + 1) % 4
  end
  
  if directions[now_direction] == "N"
    y -= 1
  elsif directions[now_direction] == "E"
    x += 1
  elsif directions[now_direction] == "S"
    y += 1
  elsif directions[now_direction] == "W"
    x -= 1
  end

  puts "#{x} #{y}"
end

# -------------------------------------------------

x, y, n = gets.chomp.split.map(&:to_i)

array = []

for i in 1..n
  array.push(gets.chomp)
end

direction = "N"

array.each do |d|
  if direction == "N"
    if d == "R"
      x += 1
      direction = "E"
    elsif d == "L"
      x -= 1
      direction = "W"
    end
  elsif direction == "E"
    if d == "R"
      y += 1
      direction = "S"
    elsif d == "L"
      y -= 1
      direction = "N"
    end
  elsif direction == "S"
    if d == "R"
      x -= 1
      direction = "W"
    elsif d == "L"
      x += 1
      direction = "E"
    end
  elsif direction == "W"
    if d == "R"
      y -= 1
      direction = "N"
    elsif d == "L"
      y += 1
      direction = "S"
    end
  end
  puts "#{x} #{y}"
end