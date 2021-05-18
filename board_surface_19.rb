# 1マスの陣取り2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_camp_step2

h, w = gets.chomp.split.map(&:to_i)

array = []

for i in 1..h
  array << gets.chomp
end

flag_out = false
for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "*"
      if 0 < y && array[y - 1][x] != "#"
        array[y - 1][x] = "*"
      end
      if 0 < x && array[y][x - 1] != "#"
        array[y][x - 1] = "*"
      end
      if y < w - 1 && array[y + 1][x] != "#"
        array[y + 1][x] = "*"
      end
      if x < w - 1 && array[y][x + 1] != "#"
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