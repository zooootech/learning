# マップの行数 H と列数 W とマップを表す H 行 W 列の文字列 S_1 ... S_H が与えられるので、
# 隣接する上下左右のマスが全て '#' であるマスの y , x 座標 を答えてください。
# ただし、左端のマスの場合は「右のマスが '#' 」であれば、右端のマスの場合は「左のマスが '#' 」であれば隣接する左右のマスが全て '#' であるものとします。
# また、上端のマスの場合は「下のマスが '#' 」であれば、下端のマスの場合は「上のマスが '#' 」であれば隣接する上下のマスが全て "#" であるものとします。
# なお、マスの座標系は左上端のマスの座標を ( y , x ) = ( 0 , 0 ) とし、
# 下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。


# 入力される値
# H W     
# S_0     
# ...     
# S_(H-1)

# ・ 1 行目には盤面の行数を表す整数 H , 盤面の列数を表す整数 W が与えられます。
# ・ 続く H 行のうち i 行目 (0 ≦ i < H) には、盤面の i 行目の文字をまとめた文字列 S_i が与えられ、 S_i の j 文字目は、盤面の i 行目の j 列目に書かれている文字を表します。(0 ≦ j < W)

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# ・ 1 行以上 H×W 行以下の出力
# 条件を満たすマスの y , x 座標を出力してください。
# 左上 (y = 0,x = 0) のマスから順に、x 座標 , y 座標の順で増加するように出力してください。詳しくは入出力例を参考にしてください。

# y_0 x_0        
# ...


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・ 1 ≦ H, W ≦ 20
# ・ S は W 文字の文字列
# ・ S の各文字は '.' または '#'
# ・ 条件を満たすマスが少なくとも 1 つ以上存在します


# 入力例1
# 3 3
# ##.
# ###
# ...

# 出力例1
# 0 0
# 0 2

# 入力例2
# 10 10
# ##########
# ..........
# ##########
# ##########
# ..........
# #.#.#.#.#.
# .#.#.#.#.#
# #.#.#.#.#.
# .#.#.#.#.#
# ..........

# 出力例2
# 6 0
# 6 2
# 6 4
# 6 6
# 6 8
# 7 1
# 7 3
# 7 5
# 7 7
# 7 9


h, w = gets.chomp.split.map(&:to_i)

array = []
for i in 1..h
  array.push(gets.chomp)
end

result = []

# 盤面の上下左右の端を除いた座標の検証
for i in 1..(h - 2)
  for j in 1..(w - 2)
    if array[i - 1][j] == "#" && array[i][j - 1] == "#" && array[i][j + 1] == "#" && array[i + 1][j] == "#"
      result.push([i, j])
    end
  end
end

# 盤面の上端(左端と右端を除く)の座標の検証
for j in 1..(w - 2)
  if array[0][j - 1] == "#" && array[0][j + 1] == "#" && array[1][j] == "#"
    result.push([0, j])
  end
end

# 盤面の下端(左端と右端を除く)の座標の検証
for j in 1..(w - 2)
  if array[h - 1][j - 1] == "#" && array[h - 1][j + 1] == "#" && array[h - 2][j] == "#"
    result.push([h - 1, j])
  end
end

# 盤面の左端(上端と下端を除く)の座標の検証
for i in 1..(h - 2)
  if array[i - 1][0] == "#" && array[i][1] == "#" && array[i + 1][0] == "#"
    result.push([i, 0])
  end
end

# 盤面の右端(上端と下端を除く)の座標の検証
for i in 1..(h - 2)
  if array[i - 1][w - 1] == "#" && array[i][w - 2] == "#" && array[i + 1][w - 1] == "#"
    result.push([i, w - 1])
  end
end

# 盤面の左上の角の座標の検証
if array[0][1] == "#" && array[1][0] == "#"
  result.push([0, 0])
end

# 盤面の右上の角の座標の検証
if array[0][w - 2] == "#" && array[1][w - 1] == "#"
  result.push([0, w - 1])
end

# 盤面の左下の角の座標の検証
if array[h - 2][0] == "#" && array[h - 1][1] == "#"
  result.push([h - 1, 0])
end

# 盤面の右下の角の座標の検証
if array[h - 2][w - 1] == "#" && array[h - 1][w - 2] == "#"
  result.push([h - 1, w - 1])
end

result.sort.each do |coodinate|
  puts "#{coodinate[0]} #{coodinate[1]}"
end

# -------------------------------------------------

h, w = gets.chomp.split.map(&:to_i)

array = []
for i in 1..h
  array.push(gets.chomp)
end

result = []

for i in 0..(h - 1)
  for j in 0..(w - 1)
    # 盤面の左上の角の座標の検証
    if i == 0 && j == 0 && array[0][1] == "#" && array[1][0] == "#"
      result.push([0, 0])
    # 盤面の右上の角の座標の検証
    elsif i == 0 && j == (w - 1) && array[0][w - 2] == "#" && array[1][w - 1] == "#"
      result.push([0, w - 1])
    # 盤面の上端(左端と右端を除く)の座標の検証
    elsif i == 0 && array[0][j - 1] == "#" && array[0][j + 1] == "#" && array[1][j] == "#"
      result.push([0, j])
    # 盤面の左下の角の座標の検証
    elsif i == (h - 1) && j == 0 && array[h - 2][0] == "#" && array[h - 1][1] == "#"
      result.push([h - 1, 0])
    # 盤面の右下の角の座標の検証
    elsif i == (h - 1) && j == (w - 1) && array[h - 2][w - 1] == "#" && array[h - 1][w - 2] == "#"
      result.push([h - 1, w - 1])
    # 盤面の左端(上端と下端を除く)の座標の検証
    elsif j == 0 && array[i - 1][0] == "#" && array[i][1] == "#" && array[i + 1][0] == "#"
      result.push([i, 0])
    # 盤面の右端(上端と下端を除く)の座標の検証
    elsif j == (w - 1) && array[i - 1][w - 1] == "#" && array[i][w - 2] == "#" && array[i + 1][w - 1] == "#"
      result.push([i, w - 1])
    # 盤面の下端(左端と右端を除く)の座標の検証
    elsif i == (h - 1) && array[h - 1][j - 1] == "#" && array[h - 1][j + 1] == "#" && array[h - 2][j] == "#"
      result.push([h - 1, j])
    # 盤面の上下左右の端を除いた座標の検証
    elsif array[i - 1][j] == "#" && array[i][j - 1] == "#" && array[i][j + 1] == "#" && array[i + 1][j] == "#"
      result.push([i, j])
    end
  end
end


result.sort.each do |coodinate|
  puts "#{coodinate[0]} #{coodinate[1]}"
end

# -------------------------------------------------

h, w = gets.chomp.split.map(&:to_i)

array = []
for i in 1..h
  array.push(gets.chomp)
end

# 行のループ処理
for i in 0..(h - 1)
  # 列のループ処理
  for j in 0..(w - 1)
    flag_row = false
    flag_column = false


  # 左右のマスが"#"であるかを flag_rowで検証
    # 左端のマスもしくは、そのマスの左のマスが"#"の場合
    if j == 0 || array[i][j - 1] == "#"
      # 右端のマスもしくは、そのマスの右のマスが"#"の場合
      if j == w - 1 || array[i][j + 1] == "#"
        flag_row = true
      end
    end

  # 上下のマスが"#"であるかを flag_column で管理
    # 上端のマスもしくは、そのマスの上のマスが"#"の場合
    if i == 0 || array[i - 1][j] == "#"
      # 下端のマスもしくは、そのマスの下のマスが"#"の場合
      if i == h - 1 || array[i + 1][j] == "#"
        flag_column = true
      end
    end

    if flag_row && flag_column
      puts "#{i} #{j}"
    end
  end
end