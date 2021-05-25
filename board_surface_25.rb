# リバーシの操作（縦横） (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_step2

# 石を置いたマスから上方向(y 座標を -i)、下方向(y 座標を +i)、右方向(x 座標を +j)、左方向(x 座標を -j)に
# 自分の石があるかどうかを探索していき、自分の石があった場合は探索を打ち切り、間のマスを繰り返しを用いて自分の石で埋めます。
# 自分の石が見つからなかったときはマップの端で探索を打ち切ることに注意してください。
# 任意の２点間で繰り返しを回したいときは、min(X + i * j, X) から max(X + i * j, X) まで繰り返しをおこなうようにすると楽です。

# 左右の確認を check_row(w, x, y, s) 上下の確認を check_column(h, x, y, s) で処理します。

h, w, y, x = gets.chomp.split.map { |i| i.to_i }

s = []
for i in 1..h
  s << gets.chomp
end

def check_row(w, y, x, s)
# stepメソッドは Numericクラスで用意されているメソッドで、Numericクラスのサブクラスである Integerクラスや Floatクラスなどのオブジェクトに対して使用できます。
# step(limit, step) {|n| ... } で、self からはじめ step を足しながら limit を越える前までブロックを繰り返します。
# 引数 limit はループの上限あるいは下限を数値で指定します。step に負の数が指定された場合は、下限として解釈されます。
# 引数 step に各ステップの大きさを数値で指定します。負の数を指定することもできます。デフォルト値は 1 。
# step(limit) {|n| ... } のように引数 step を指定しなかった場合、デフォルト値が 1 のため、self からはじめ 1 を足しながら limit を越える前までブロックを繰り返します。
# ブロック変数 n は繰り返し処理の中で x に足す数値の符号を切り替える役割を持つ。
# ブロック変数 n に -1, 1を順番に代入し、-1 のときは負の数を, 1 のときは正の数を x に足す。
# これにより、石を置いたマス s[y][x] より左方向もしくは右方向のマスに石が置いてあるかを探索する
  -1.step(1, 2) do |n|
    i = 1
    # until は条件式を評価した値が真になるまで、本体を繰り返して実行します。
    # || は左辺を評価し、結果が真であった場合にはその値を返します。左辺の評価結果が偽であった場合には右辺を評価しその評価結果を返します。
    until (x + i * n) < 0 || (w - 1) < (x + i * n)
      if s[y][x + i * n] == "*"
        j = 1
        while x + j * n != x + i * n
          s[y][x + j * n] = "*"
          j += 1
        end
        break
      end
      i += 1
    end
  end
end

def check_column(h, y, x, s)
  -1.step(1, 2) do |n|
    i = 1
    until (y + i * n) < 0 || (h - 1) < (y + i * n)
      if s[y + i * n][x] == "*"
        j = 1
        while (y + j * n) != (y + i * n)
          s[y + j * n][x] = "*"
          j += 1
        end
        break
      end
      i += 1
    end
  end
end

s[y][x] = "*"

check_row(h, x, y, s)
check_column(w, x, y, s)

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, y, x = gets.chomp.split.map {|i| i.to_i}

s = []
for i in 1..h
  s << gets.chomp
end

def check_row(w, y, x, s)
  -1.step(1, 2) do |n|
    i = 0
    while true
      i += 1
      break if (x + i * n) < 0 || (w - 1) < (x + i * n)
      if s[y][x + i * n] == "*"
        j = 0
        while true
          j += 1
          break if (x + j * n) == (x + i * n)
          s[y][x + j * n] = "*"
        end
        break
      end
    end
  end
end

def check_column(h, y, x, s)
  -1.step(1, 2) do |n|
    i = 0
    while true
      i += 1
      break if (y + i * n) < 0 || (h - 1) < (y + i * n)
      if s[y + i * n][x] == "*"
        j = 0
        while true
          j += 1
          break if (y + j * n) == (x + i * n)
          s[y + j * n][x] = "*"
        end
        break
      end
    end
  end
end

s[y][x] = "*"

check_row(h, x, y, s)
check_column(w, x, y, s)

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, y, x = gets.chomp.split.map {|i| i.to_i}

s = []
for i in 1..h
  s << gets.chomp
end

s[y][x] = "*"


# 範囲演算子 ... で生成された範囲オブジェクトは終端を含みません。
# 1...5 は 1 以上 5 未満を表す
# 範囲オブジェクトはRangeクラスのインスタンス
# reverse_each は各要素に対して逆順にブロックを評価します。
# (1...5).reverse_each {|n| ... } の場合、ブロックの評価の対象となる要素とその順番は、左から 4 3 2 1 となる

# x より左のマスの検証
# x の一つ左隣のマスから左端に向かって繰り返し処理を行う
# x が 0 の場合、範囲式が (0...0) となり、終端を含まない範囲オブジェクトなので、それは 0 以上 0 未満を表し、よって繰り返し処理は一度も行われない
# 例えば (0..0).each {|n| ... } の場合、範囲式 (0..0)は 0 以上 0 以下を表し、繰り返し処理は 1 回行われ、その際、ブロック変数 n には 0 が代入される
(0...x).reverse_each do |i|
  if s[y][i] == "*"  # マスが * の場合
    # ((i + 1)...x) は s[y][i] の一つ右隣のから x の一つ左隣までを表し、その区間のマスを繰り返し処理で * に変える
    ((i + 1)...x).each do |j|
      s[y][j] = "*"
    end
    break
  end
end

# x より右のマスの検証
((x + 1)..(w - 1)).each do |i|
  if s[y][i] == "*"
    ((x + 1)...i).each do |j|
      s[y][j] = "*"
    end
    break
  end
end

# y より上のマスの検証
(0...y).reverse_each do |i|
  if s[i][x] == "*"
    ((i + 1)...y).each do |j|
      s[j][x] = "*"
    end
    break
  end
end

# y より下のマスの検証
((y + 1)..(h - 1)).each do |i|
  if s[i][x] == "*"
    ((y + 1)...i).each do |j|
      s[j][x] = "*"
    end
    break
  end
end

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, y, x = gets.chomp.split.map {|i| i.to_i}

s = []
for i in 1..h
  s << gets.chomp
end

s[y][x] = "*"

# x より左のマスの検証
i = x - 1
while i >= 0  # 石を置いたマスより左の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  if s[y][i] == "*"
    j = i + 1
    while j != x  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      s[y][j] = "*"
      j += 1
    end
    break
  end
  i -= 1
end

# x より右のマスの検証
i = x + 1
while i <= w - 1  # 石を置いたマスより右の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  if s[y][i] == "*"
    j = i - 1
    while j != x  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      s[y][j] = "*"
      j -= 1
    end
    break
  end
  i += 1
end

# y より上のマスの検証
i = y - 1
while i >= 0  # 石を置いたマスより上の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  if s[i][x] == "*"
    j = i + 1
    while j != y  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      s[j][x] = "*"
      j += 1
    end
    break
  end
  i -= 1
end

# y より下のマスの検証
i = y + 1
while i <= h - 1  # 石を置いたマスより下の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  if s[i][x] == "*"
    j = i - 1
    while j != x  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      s[j][x] = "*"
      j -= 1
    end
    break
  end
  i += 1
end

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, y, x = gets.chomp.split.map {|i| i.to_i}

s = []
for i in 1..h
  s << gets.chomp
end

s[y][x] = "*"

# x より左のマスの検証
i = 1
while true  # 石を置いたマスより左の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  break if x - i < 0
  if s[y][x - i] == "*"
    j = x - i
    while true  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      j += 1
      break if j == x
      s[y][j] = "*"
    end
    break
  end
  i += 1
end

# x より右のマスの検証
i = 1
while true  # 石を置いたマスより右の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  break if x + i > w - 1
  if s[y][x + i] == "*"
    j = x + i
    while true  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      j -= 1
      break if j == x
      s[y][j] = "*"
    end
    break
  end
  i += 1
end

# y より上のマスの検証
i = 1
while true  # 石を置いたマスより上の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  break if y - i < 0
  if s[y - i][x] == "*"
    j = y - i
    while true  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      j += 1
      break if j == y
      s[j][x] = "*"
    end
    break
  end
  i += 1
end

# y より下のマスの検証
i = 1
while true  # 石を置いたマスより下の延長線上のマスに石が置かれているかどうかを確認するためのループ処理
  break if y + i > h - 1
  if s[y + i][x] == "*"
    j = y + i
    while true  # 石を置いたマスと石が置かれているマスに挟まれている区間のマスを * に変えるためのループ処理
      j -= 1
      break if j == y
      s[j][x] = "*"
    end
    break
  end
  i += 1
end

s.each do |row|
  puts row
end

# -------------------------------------------------

# h, w, y, x = gets.chomp.split.map {|i| i.to_i}

# s = []
# for i in 1..h
#   s << gets.chomp
# end

# s[y][x] = "*"

# left_length = x - 0
# rigth_length = (w - 1) - x
# top_length = y - 0
# bottom = (h - 1) - y

# left_length.

# -------------------------------------------------

# 以下、誤った回答

# h, w, y, x = gets.chomp.split.map {|i| i.to_i}

# s = []
# for i in 1..h
#   s << gets.chomp
# end

# s[y][x] = "*"

# for i in 0..(h - 1)
#   for j in 0..(w - 1)
#     if 0 < i && i < h - 1 && s[i][j] == "."
#       if [y, x] == [i - 1, j] && s[i + 1][j] == "*"
#         s[i][j] = "*"
#       elsif [y, x] == [i + 1, j] && s[i - 1][j] == "*"
#         s[i][j] = "*"
#       end
#     end
#     if 0 < j && j < w - 1 && s[i][j] == "."
#       if [y, x] == [i, j - 1] && s[i][j + 1] == "*"
#         s[i][j] = "*"
#       elsif [y, x] == [i, j + 1] && si][j - 1] == "*"
#         s[i][j] = "*"
#       end
#     end
#   end
# end

# s.each do |row|
#   puts row
# end

# -------------------------------------------------

# 以下、誤った回答

# h, w, y, x = gets.chomp.split.map {|i| i.to_i}

# array = []
# for i in 1..h
#   array << gets.chomp
# end

# array[y][x] = "*"

# array2 = []

# for i in 0..(h - 1)
#   for j in 0..(w - 1)
#     if ((0 < i && i < h - 1) || (0 < j && j < w - 1)) && array[i][j] == "."
#       if array[i - 1][j] == "*" && array[i + 1][j] == "*"
#         array2 << [i, j]
#       elsif array[i][j - 1] == "*" && array[i][j + 1] == "*"
#         array2 << [i, j]
#       end
#     end
#   end
# end

# array2.each 

# -------------------------------------------------

# 以下、誤った回答（問題の意図を読み違えたため）

# h, w, y, x = gets.chomp.split.map {|i| i.to_i}

# array = []
# for i in 1..h
#   array << gets.chomp
# end

# array[y][x] = "*"

# array2 = []

# for i in 0..(h - 1)
#   for j in 0..(w - 1)
#     if ((0 < i && i < h - 1) || (0 < j && j < w - 1)) && array[i][j] == "."
#       if array[i - 1][j] == "*" && array[i + 1][j] == "*"
#         array2 << i
#         array2 << j
#       elsif array[i][j - 1] == "*" && array[i][j + 1] == "*"
#         array2 << i
#         array2 << j
#       end
#     end
#   end
# end
  
# array2.each_slice(2) do |y, x|
#   array[y][x] = "*"
# end

# array.each do |row|
#   puts row
# end