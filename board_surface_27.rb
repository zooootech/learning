# リバーシの操作（斜め） (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_step4

# 石を置いたマスから右上方向(y 座標を +j, x 座標を +j)、右下方向(y 座標を -j, x 座標を +j)、左上方向(y 座標を +j, x 座標を -j)、左下方向(y 座標を -j, x 座標を -j)に自分の石があるかどうかを探索していき、自分の石があった場合は探索を打ち切り、間のマスを繰り返しを用いて自分の石で埋めます。
# 自分の石が見つからなかったときはマップの端で探索を打ち切ることに注意してください。


h, w, y, x = gets.chomp.split.map(&:to_i)

s = []
h.times do
  s << gets.chomp
end

def check(h, w, y, x, s)
  # 左上方向、右上方向、右下方向、左下方向の 4 パターンの繰り返し処理（自分の石があるかどうかの探索）を行いたいため、 2 回分の処理を行う each の中に、同じ 2 回分の処理を行う each を挿入（2 × 2 の組み合わせ）
  [-1, 1].each do |n|
    [-1, 1].each do |m|
      i = 0
      while true
        i += 1
        break if y + i * n < 0 || x + i * m < 0 || h - 1 < y + i * n || w - 1 < x + i * m
        if s[y + i * n][x + i * m] == "*"
          (1..(i - 1)).each do |j|
            s[y + j * n][x + j * m] = "*"
          end
          break
        end
      end
    end
  end
end

s[y][x] = "*"

check(h, w, y, x, s)

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, y, x = gets.chomp.split.map(&:to_i)

s = []
h.times do
  s << gets.chomp
end

s[y][x] = "*"

i = y
j = x
while 0 < i && 0 < j
  if s[i - 1][j - 1] == "*"
    until i == y || j == x
      s[i][j] = "*"
      i += 1
      j += 1
    end
    break
  end
  i -= 1
  j -= 1
end

i = y
j = x
while 0 < i && j < w - 1
  if s[i - 1][j + 1] == "*"
    until i == y || j == x
      s[i][j] = "*"
      i += 1
      j -= 1
    end
    break
  end
  i -= 1
  j += 1
end

i = y
j = x
while i < h - 1 && j < w - 1
  if s[i + 1][j + 1] == "*"
    until i == y || j == x
      s[i][j] = "*"
      i -= 1
      j -= 1
    end
    break
  end
  i += 1
  j += 1
end

i = y
j = x
while i < h - 1 && 0 < j
  if s[i + 1][j - 1] == "*"
    until i == y || j == x
      s[i][j] = "*"
      i -= 1
      j += 1
    end
    break
  end
  i += 1
  j -= 1
end

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, y, x = gets.chomp.split.map(&:to_i)

s = []
h.times do
  s << gets.chomp
end

s[y][x] = "*"

i = y
j = x
while true
  i -= 1
  j -= 1
  break if i < 0 && j < 0
  if s[i][j] == "*"
    i += 1
    j += 1
    until i == y || j == x
      s[i][j] = "*"
      i += 1
      j += 1
    end
    break
  end
end

i = y
j = x
while true
  i -= 1
  j += 1
  break if i < 0 && w - 1 < j
  if s[i][j] == "*"
    i += 1
    j -= 1
    until i == y || j == x
      s[i][j] = "*"
      i += 1
      j -= 1
    end
    break
  end
end

i = y
j = x
while true
  i += 1
  j += 1
  break if h - 1 < i && w - 1 < j
  if s[i][j] == "*"
    i -= 1
    j -= 1
    until i == y || j == x
      s[i][j] = "*"
      i -= 1
      j -= 1
    end
    break
  end
end

i = y
j = x
while true
  i += 1
  j -= 1
  break if h - 1 < i && j < 0
  if s[i][j] == "*"
    i -= 1
    j += 1
    until i == y || j == x
      s[i][j] = "*"
      i -= 1
      j += 1
    end
    break
  end
end

s.each do |row|
  puts row
end