# いびつなリバーシ対戦（２人） (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_step8

# 順番の管理について、順番の周り方が規則的である場合(A,B,A,B...)は for文のカウント変数について人数のmod(剰余)をプレイヤーの番号として取ると順番の管理がしやすく、if文も少し簡潔になります。
# ex) ２人の時, h をカウント変数としたループ内で、h%2==0 のときAのターン、h%2==1 のときBのターンとする。
# 各行動は独立しているので、各操作を順に行うことで解くことができます。

h, w, n = gets.chomp.split.map(&:to_i)

s = []
h.times do
  s << gets.chomp
end

points = []
(n * 2).times do
  points << gets.chomp.split.map(&:to_i)
end

player = "A"

def check_row(w, y, x, s, player)
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (x + i * n) < 0 || (w - 1) < (x + i * n) || s[y][x + i * n] == "#"
      if s[y][x + i * n] == player
        j = 0
        while true
          j += 1
          break if (x + j * n) == (x + i * n)
          s[y][x + j * n] = player
        end
        break
      end
    end
  end
end

def check_column(h, y, x, s, player)
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (y + i * n) < 0 || (h - 1) < (y + i * n) || s[y + i * n][x] == "#"
      if s[y + i * n][x] == player
        j = 0
        while true
          j += 1
          break if (y + j * n) == (y + i * n)
          s[y + j * n][x] = player
        end
        break
      end
    end
  end
end

def check_diagonal(h, w, y, x, s, player)
  [-1, 1].each do |n|
    [-1, 1].each do |m|
      i = 0
      while true
        i += 1
        break if y + i * n < 0 || x + i * m < 0 || h - 1 < y + i * n || w - 1 < x + i * m || s[y + i * n][x + i * m] == "#"
        if s[y + i * n][x + i * m] == player
          (1..(i - 1)).each do |j|
            s[y + j * n][x + j * m] = player
          end
          break
        end
      end
    end
  end
end

points.each do |y, x|
  s[y][x] = player

  check_row(w, y, x, s, player)
  check_column(h, y, x, s, player)
  check_diagonal(h, w, y, x, s, player)

  if player == "A"
    player = "B"
  else
    player = "A"
  end
end

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, n = gets.chomp.split.map(&:to_i)

s = []
h.times do
  s << gets.chomp
end

def check_row(w, y, x, s, player)
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (x + i * n) < 0 || (w - 1) < (x + i * n) || s[y][x + i * n] == "#"
      if s[y][x + i * n] == player
        j = 0
        while true
          j += 1
          break if (x + j * n) == (x + i * n)
          s[y][x + j * n] = player
        end
        break
      end
    end
  end
end

def check_column(h, y, x, s, player)
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (y + i * n) < 0 || (h - 1) < (y + i * n) || s[y + i * n][x] == "#"
      if s[y + i * n][x] == player
        j = 0
        while true
          j += 1
          break if (y + j * n) == (y + i * n)
          s[y + j * n][x] = player
        end
        break
      end
    end
  end
end

def check_diagonal(h, w, y, x, s, player)
  [-1, 1].each do |n|
    [-1, 1].each do |m|
      i = 0
      while true
        i += 1
        break if y + i * n < 0 || x + i * m < 0 || h - 1 < y + i * n || w - 1 < x + i * m || s[y + i * n][x + i * m] == "#"
        if s[y + i * n][x + i * m] == player
          (1..(i - 1)).each do |j|
            s[y + j * n][x + j * m] = player
          end
          break
        end
      end
    end
  end
end

(n * 2).times do |count|
  y, x = gets.chomp.split.map(&:to_i)

  if count.even?
    player = "A"
  else
    player = "B"
  end

  s[y][x] = player

  check_row(w, y, x, s, player)
  check_column(h, y, x, s, player)
  check_diagonal(h, w, y, x, s, player)
end

s.each do |row|
  puts row
end