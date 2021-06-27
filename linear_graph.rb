# りんご拾い（情報を持ちながらの移動） (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_graph_step6

# -------------------------------------------------

# 隣接行列を用いた解法

n = gets.to_i
graph = Array.new(n).map { Array.new(n, 0) }

(n - 1).times do
  a, b = gets.chomp.split.map(&:to_i)

  graph[a - 1][b - 1] = 1
  graph[b - 1][a - 1] = 1
end

apples = []
n.times do
  apple = gets.to_i
  apples << apple
end

index = 0
sum = 0
n.times do
  sum += apples[index]
  puts sum

  if graph[index].include?(1)
    next_index = graph[index].index(1)
    graph[next_index][index] = 0
    index = next_index
  end
end

# -------------------------------------------------

# 隣接リストを用いた解法

n = gets.to_i
graph = Array.new(n) { [] }
visit = []
done = [0] * n

(n - 1).times do
  a, b = gets.chomp.split.map(&:to_i)

  graph[a - 1] << b - 1
  graph[b - 1] << a - 1
end

apples = []
n.times do
  apple = gets.to_i
  apples << apple
end

visit << 0
done[0] = 1

while visit.length != n
  now = visit[-1]
  graph[now].length.times do |i|
    if done[graph[now][i]] == 0
      visit << graph[now][i]
      done[graph[now][i]] = 1
    end
  end
end

sum = 0
visit.each do |j|
  sum += apples[j]
  puts sum
end
