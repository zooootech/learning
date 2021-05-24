# 裏返せる可能性（縦横） (paizaランク C 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_pincerattack_step1

h, w, y, x = gets.chomp.split.map(&:to_i)

array = Array.new(h).map {Array.new(w, ".")}

for i in 0..(h - 1)
  for j in 0..(w - 1)
    if i == y && j ==x
      array[i][j] = "!"
    elsif i == y
      array[i][j] = "*"
    elsif j == x
      array[i][j] = "*"
    end
  end
end

array.each do |row|
  row.each do |coordinate|
    print coordinate
  end
  puts ""
end

# -------------------------------------------------

h, w, y, x = gets.chomp.split.map(&:to_i)

for i in 0..(h - 1)
  for j in 0..(w - 1)
    if i == y && j ==x
      print "!"
    elsif i == y
      print "*"
    elsif j == x
      print "*"
    else
      print "."
    end
  end
  puts ""
end