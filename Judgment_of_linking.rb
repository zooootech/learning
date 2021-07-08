# 連結の判定 (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_graph_boss

# 一直線のグラフと異なり、 １ つの頂点からの遷移先が １ つとは限らないので queue を用いた幅優先探索をします。
# グラフが連結かどうかを見るには、 「任意の１つの頂点から幅優先探索などで、たどり着ける頂点に色を塗った際に、全ての頂点に色を塗ることができるか。」 を判定すれば良いです。これを判定するには、次の処理を行えば良いです。
# 任意の頂点を queue に入れる
# ( queue が空になるまで繰り返し )
# {
# queue の先頭を取り出す
# graph の情報を元に取り出した頂点につながっている頂点を全て調べる、まだ訪れたことがなければ色を塗り、 queue に入れる
# }
# 全ての頂点に色が塗ってあれば、任意の頂点から全ての頂点に行けるということなので YES
# １ つでも色の塗られていない点がある場合 NO とすれば良いです。

# -------------------------------------------------

# 隣接リストの深さ優先探索

# 方針では幅優先探索をしていますが当コードでは深さ優先探索をしています。
# points をスタックとして扱います。
# flags でその頂点を訪れたかを管理しています。
# 探索を頂点 0 から始めるため points に 0 を入れ flags[0] を 1 にします。

n, m  = gets.split.map(&:to_i)
g = Array.new(n).map { Array.new([]) }
flags = [0] * n

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  g[a - 1] << b - 1
  g[b - 1] << a - 1
end

points = [0]
flags[0] = 1

# 探索すべき頂点がなくなるまでループします。
# まだ探索してなくて繋がっているなら points に追加します。
# 未探索の頂点があれば NO と出力し、なければ YES と出力します。

while points.length > 0
  # pop は自身の末尾から要素を取り除いてそれを返します。 pop(n) のように引数を指定した場合はその個数だけ取り除き、それを配列で返します。
  point = points.pop
  g[point].length.times do |i|
    if flags[g[point][i]] == 0
      flags[g[point][i]] = 1
      points << g[point][i]
    end
  end
end

if flags.include?(0)
  puts "NO"
else
  puts "YES"
end

# -------------------------------------------------

# 隣接リストの幅優先探索

# points をキューとして扱います。

n, m  = gets.split.map(&:to_i)
g = Array.new(n).map { Array.new([]) }
flags = [0] * n

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  g[a - 1] << b - 1
  g[b - 1] << a - 1
end

points = [0]
flags[0] = 1

while points.length > 0
  # shift は配列の先頭の要素を取り除いてそれを返します。 shift(n) のように引数を指定した場合はその個数だけ取り除き、それを配列で返します。
  point = points.shift
  g[point].length.times do |i|
    if flags[g[point][i]] == 0
      flags[g[point][i]] = 1
      points << g[point][i]
    end
  end
end

if flags.include?(0)
  puts "NO"
else
  puts "YES"
end

# -------------------------------------------------

# 隣接行列の深さ優先探索

n, m  = gets.split.map(&:to_i)
g = Array.new(n).map { Array.new(n, 0) }
flags = [0] * n

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  g[a - 1][b - 1] = 1
  g[b - 1][a - 1] = 1
end

points = [0]
flags[0] = 1

while points.length > 0
  # pop は自身の末尾から要素を取り除いてそれを返します。 pop(n) のように引数を指定した場合はその個数だけ取り除き、それを配列で返します。
  point = points.pop
  g[point].length.times do |i|
    if g[point][i] == 1
      g[point][i] = 0
      g[i][point] = 0
      points << i
      flags[i] = 1
    end
  end
end

if flags.include?(0)
  puts "NO"
else
  puts "YES"
end

# -------------------------------------------------

# 隣接行列の幅優先探索

n, m  = gets.split.map(&:to_i)
g = Array.new(n).map { Array.new(n, 0) }
flags = [0] * n

m.times do
  a, b = gets.chomp.split.map(&:to_i)

  g[a - 1][b - 1] = 1
  g[b - 1][a - 1] = 1
end

points = [0]
flags[0] = 1

while points.length > 0
  # shift は配列の先頭の要素を取り除いてそれを返します。 shift(n) のように引数を指定した場合はその個数だけ取り除き、それを配列で返します。
  point = points.shift
  g[point].length.times do |i|
    if g[point][i] == 1
      g[point][i] = 0
      g[i][point] = 0
      points << i
      flags[i] = 1
    end
  end
end

if flags.include?(0)
  puts "NO"
else
  puts "YES"
end

# -------------------------------------------------