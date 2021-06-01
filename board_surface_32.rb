# いびつなリバーシ対戦 (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_boss

h, w, m, n = gets.chomp.split.map(&:to_i)

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

n.times do
  player, y, x = gets.chomp.split

  y = y.to_i
  x = x.to_i

  s[y][x] = player

  check_row(w, y, x, s, player)
  check_column(h, y, x, s, player)
  check_diagonal(h, w, y, x, s, player)
end

s.each do |row|
  puts row
end

# -------------------------------------------------

h, w, m, n = gets.chomp.split.map(&:to_i)

s = []
h.times do
  s << gets.chomp
end

points = []
n.times do
  points << gets.chomp.split.map(&:to_i)
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

points.each do |player, y, x|
  s[y][x] = player.to_s

  check_row(w, y, x, s, player.to_s)
  check_column(h, y, x, s, player.to_s)
  check_diagonal(h, w, y, x, s, player.to_s)
end

s.each do |row|
  puts row
end