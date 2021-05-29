# いびつなひとりリバーシ（１ターン） (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_step6

# 問題文から、穴の空いているマスを挟んで石をおけないので、石を置いた方から各方向に行う自分の石の探索の途中で # が出てきたら、 打ち切るという条件文を追加して各方向に探索することで、# を挟んで石を置かないようにできます。

h, w = gets.chomp.split.map { |n| n.to_i }

s = []

h.times do
  s.push(gets.chomp)
end

y = 0
x = 0
flag_out = false
s.each do |row|
  w.times do |index|
    if row[index] == "!"
      x = index
      flag_out = true
      break
    end
  end
  break if flag_out
  y += 1
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

s[y][x] = "*"

check_row(w, y, x, s)
check_column(h, y, x, s)
check_diagonal(h, w, y, x, s)

s.each do |row|
  puts row
end