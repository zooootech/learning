# 1マスの陣取り (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_camp_step1

# '*' のマスが S[i][j] のとき、陣地にできるマスは S[i-1][j], S[i+1][j], S[i][j-1], S[i][j+1] の４つ
# 盤面の範囲外にアクセスしないように気をつけましょう。
# 条件文を用いて判定するか、実装例の通り、S[min(,H-1)][],S[max(0,)][] を用いると簡潔に書くことができます。
# 盤面の変更を行った後、そのまま繰り返しを続けてしまうと、陣地を広げる操作が再びおこなわれてしまうので気をつけましょう。


h, w = gets.chomp.split.map(&:to_i)

array = []

for i in 1..h
  array << gets.chomp
end

flag_out = false
for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "*"
      if 0 < y
        array[y - 1][x] = "*"
      end
      if 0 < x
        array[y][x - 1] = "*"
      end
      if y < w - 1
        array[y + 1][x] = "*"
      end
      if x < w - 1
        array[y][x + 1] = "*"
      end
      flag_out = true
      break
    end
  end
  break if flag_out
end

array.each do |row|
  puts row
end

# -------------------------------------------------

h, w = gets.chomp.split.map(&:to_i)

array = []

for i in 1..h
  array << gets.chomp
end

for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "*"
      sy = y
      sx = x
    end
  end
end

if 0 < sy
  array[sy - 1][sx] = "*"
end
if 0 < sx
  array[sy][sx - 1] = "*"
end
if sy < w - 1
  array[sy + 1][sx] = "*"
end
if sx < w - 1
  array[sy][sx + 1] = "*"
end

array.each do |row|
  puts row
end