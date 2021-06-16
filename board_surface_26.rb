# 裏返せる可能性（斜め） (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_step3

h, w, y, x = gets.chomp.split.map(&:to_i)

s = Array.new(h).map { Array.new(w, ".") }

s[y][x] = "!"

i = y
j = x
while i != 0 && j != 0
  s[i - 1][j - 1] = "*"
  i -= 1
  j -= 1
end

i = y
j = x
while i != 0 && j != w - 1
  s[i - 1][j + 1] = "*"
  i -= 1
  j += 1
end

i = y
j = x
while i != h - 1 && j != w - 1
  s[i + 1][j + 1] = "*"
  i += 1
  j += 1
end

i = y
j = x
while i != h - 1 && j != 0
  s[i + 1][j - 1] = "*"
  i += 1
  j -= 1
end

s.each do |row|
  row.each do |coordinate|
    print coordinate
  end
  puts ""
end

# -------------------------------------------------

# 石を置くマスの座標を (Y, X) とすると、石を置いたマスを通る斜めのマス (y, x) の満たす条件は、 (y == Y + j || x == X + j) || (y == Y - j || x == X - j) です。
# ただし、(y == Y && x == X) のときは、石を置いたマスなので注意が必要です。

h, w, y, x = gets.chomp.split.map(&:to_i)

h.times do |i|
  w.times do |j|
    if i == y && j == x
      print "!"
    # ある特定のマスの座標 (a, b) と指定されたマスの座標 (c, d)について、 a - c の絶対値と b - d の絶対値が等しい場合、そのマスは指定のマスを通る斜めのマスであると言える
    # ある特定のマス A と、指定されたマス B について、A の x 座標の値から B の x 座標の値を引いた絶対値と A の y 座標の値から B の y 座標の値 を引いた絶対値が等しい場合、そのマスは指定のマスを通る斜めのマスであると言える
    # abs は self の絶対値を返します。
    elsif (i - y).abs == (j - x).abs
      print "*"
    else
      print "."
    end
  end
  puts ""
end