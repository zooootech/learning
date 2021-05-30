# いびつなひとりリバーシ (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_step7

h, w, n = gets.chomp.split.map(&:to_i)

s = []
h.times do
  s << gets.chomp
end

def check_row(w, y, x, s)
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (x + i * n) < 0 || (w - 1) < (x + i * n) || s[y][x + i * n] == "#"
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
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (y + i * n) < 0 || (h - 1) < (y + i * n) || s[y + i * n][x] == "#"
      if s[y + i * n][x] == "*"
        j = 0
        while true
          j += 1
          break if (y + j * n) == (y + i * n)
          s[y + j * n][x] = "*"
        end
        break
      end
    end
  end
end

def check_diagonal(h, w, y, x, s)
  [-1, 1].each do |n|
    [-1, 1].each do |m|
      i = 0
      while true
        i += 1
        break if y + i * n < 0 || x + i * m < 0 || h - 1 < y + i * n || w - 1 < x + i * m || s[y + i * n][x + i * m] == "#"
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

n.times do
  y, x = gets.chomp.split.map(&:to_i)

  s[y][x] = "*"

  check_row(w, y, x, s)
  check_column(h, y, x, s)
  check_diagonal(h, w, y, x, s)
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

points = []
n.times do
  points << gets.chomp.split.map(&:to_i)
end

def check_row(w, y, x, s)
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (x + i * n) < 0 || (w - 1) < (x + i * n) || s[y][x + i * n] == "#"
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
  [-1, 1].each do |n|
    i = 0
    while true
      i += 1
      break if (y + i * n) < 0 || (h - 1) < (y + i * n) || s[y + i * n][x] == "#"
      if s[y + i * n][x] == "*"
        j = 0
        while true
          j += 1
          break if (y + j * n) == (y + i * n)
          s[y + j * n][x] = "*"
        end
        break
      end
    end
  end
end

def check_diagonal(h, w, y, x, s)
  [-1, 1].each do |n|
    [-1, 1].each do |m|
      i = 0
      while true
        i += 1
        break if y + i * n < 0 || x + i * m < 0 || h - 1 < y + i * n || w - 1 < x + i * m || s[y + i * n][x + i * m] == "#"
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

# 二次元配列である points は、 2 つの数値を要素として持つ配列 を、 n 個要素として持っている
# points から each を用いて取り出したある 1 つの要素は 2 つの数値を持っているため、それぞれ y, x に代入する
points.each do |y, x|
  s[y][x] = "*"

  check_row(w, y, x, s)
  check_column(h, y, x, s)
  check_diagonal(h, w, y, x, s)
end

s.each do |row|
  puts row
end