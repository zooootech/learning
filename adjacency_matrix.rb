# 隣接行列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_graph_step1

# 隣接リスト g を初期値 0 で定義し、m 個のエッジを受け取り処理します。

# -------------------------------------------------

n, m = gets.split.map(&:to_i)

g = Array.new(n).map { Array.new(n, 0) }

m.times do
  vertex1, vertex2 = gets.split.map(&:to_i)
  g[vertex1 - 1][vertex2 - 1] = 1
  g[vertex2 - 1][vertex1 - 1] = 1
end

g.each do |row|
  row.each do |num|
    print num
  end
  puts ""
end

# -------------------------------------------------

n, m = gets.split.map(&:to_i)

g = Array.new(n).map { Array.new(n, 0) }

m.times do
  vertex1, vertex2 = gets.split.map(&:to_i)
  g[vertex1.pred][vertex2.pred] = 1  # pred は self から -1 した値を返します。
  g[vertex2.pred][vertex1.pred] = 1
end

g.each do |row|
  row.each do |num|
    print num
  end
  puts ""
end