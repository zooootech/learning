# 有向グラフの隣接行列と隣接リスト (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_graph_step3

n, m = gets.split.map(&:to_i)

g = Array.new(n).map { Array.new(n, 0) }

h = Array.new(n){ [] }

m.times do
  a, b = gets.split.map(&:to_i)

  g[a - 1][b - 1] = 1

  h[a - 1] << b - 1
end

g.each do |row|
  row.each do |num|
    print num
  end
  puts ""
end

h.each do |row|
  # sort は配列の内容をソートします。要素同士の比較は <=> 演算子を使って行います。sort はソートされた配列を生成して返します。
  row.sort.each do |num|
    print num
  end
  puts ""
end

# -------------------------------------------------

n, m = gets.split.map(&:to_i)

g = Array.new(n).map { Array.new(n, 0) }

h = Array.new(n){ [] }

m.times do
  a, b = gets.split.map(&:to_i)

  g[a - 1][b - 1] = 1
end

g.each do |row|
  row.each do |num|
    print num
  end
  puts ""
end

g.length.times do |i|
  g[i].length.times do |j|
    if g[i][j] == 1
      print j
    end
  end
  puts ""
end

# -------------------------------------------------

n, m = gets.split.map(&:to_i)

g = Array.new(n).map { Array.new(n, 0) }

h = Array.new(n) { [] }

m.times do
  a, b = gets.split.map(&:to_i)

  g[a - 1][b - 1] = 1
end

g.each do |row|
  row.each do |num|
    print num
  end
  puts ""
end

for i in 0..n
  for j in 0..n
    if g[i][j] == 1
      print j
    end
  end
  puts ""
end

# -------------------------------------------------

n, m = gets.split.map(&:to_i)

g = Array.new(n).map { Array.new(n, 0) }

h = Array.new(n){ [] }

m.times do
  a, b = gets.split.map(&:to_i)

  g[a - 1][b - 1] = 1
end

g.each do |row|
  row.each do |num|
    print num
  end
  puts ""
end

for i in 0...n
  for j in 0...n
    if g[i][j] == 1
      print j
    end
  end
  puts ""
end