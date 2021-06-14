# マップの判定・縦横 (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_map_boss

# マップの j 行 i 列のマスに隣接している要素は、それぞれ S[i][j-1], S[i][j+1], S[i-1][j], S[i+1][j] で受け取れます。
# 上下左右の端のマスの時は、マップ外に当たるマスは条件を満たすとするか、例外的に処理して判定します。

# 二重ループを使いすべてのマスを確認します。
# 左右のマスが"#"であるかを flag_row 、上下のマスが"#"であるかを flag_column で管理します。
# flag_row and flag_column が True のときマスの座標を出力しています。

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

# -------------------------------------------------

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