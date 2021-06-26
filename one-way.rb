# 一方通行（グラフ上の移動） (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_graph_step5

# グラフの辺を移動していく処理は、基本的には幅優先探索とみなせます。今回の問題はその中でも遷移先が １ つという特殊なパターンだと思ってください。
# グラフの頂点を一度ずつ訪れる問題では、訪れたかどうかを管理する配列を持っておくと、グラフ上での逆走を防ぐことができ、うまく実装できます。
# 幅優先探索の一種なので、「移動を行う→移動先を記録」 の繰り返しが基本です。これを繰り返しながら、訪れた頂点を順に出力していきます。
# この問題では遷移先が １ つであることが保証されているため、移動→移動先を記録 が各頂点につき最大 １ 回しか起こらないので queue を用いなくても配列で訪れた頂点を順番に出力しながら、末尾の要素を使って探索できます。

# 隣接行列を使い実装しています。
# 移動した後、来た道を戻らないよう 0 に書き換えています。

# 今回は、多重辺や自己ループがない、単方向(一方向)で線形なデータ構造をとります。

# -------------------------------------------------

# 隣接行列を用いた解法

# 隣接行列を用いた場合、二次元配列 g で、 2 つの要素(達した頂点の値(データ)と、次の頂点を指し示す値(ポインタ))を一緒に管理する
# g の要素を 0 もしくは 1 とし、要素が 1 の部分の添字(インデックス)が達した頂点の番号もしくは次の頂点の番号を示している
# g の、行の添字(インデックス)が「達した頂点」に対応し、列の添字(インデックス)が「次の頂点」に対応している

n = gets.to_i

g = Array.new(n).map { Array.new(n, 0) }

(n - 1).times do
  a, b = gets.split.map(&:to_i)
  # もし a がデータ(その要素が持つ値)で、 b がポインタ(次の要素を指し示す値)と決まっている場合、処理は g[a - 1][b - 1] = 1 だけで良い
  g[a - 1][b - 1] = 1
  g[b - 1][a - 1] = 1
end

index = 0
n.times do
  puts index + 1

  end
  if g[index].include?(1)
    next_index = g[index].index(1)
    # もし a がデータ(その要素が持つ値)で、 b がポインタ(次の要素を指し示す値、リンクとなる値)と決まっている場合、処理 g[next_index][index] = 0 は省ける
    g[next_index][index] = 0
    index = next_index
end

# -------------------------------------------------

# 隣接リストを用いた解法

n = gets.to_i

# n 個の空配列を要素に持つ配列を生成(二次元配列の生成)
# 単方向線形リストは、要素が持つ値(データ)と、次の要素を指し示す値（リンクとなる値）で構成される
# この配列に記録するのは、頂点が持つ値(データ)と、次の頂点を指し示す値（リンクとなる値）
graph = Array.new(n) { [] }  # => [[], [], [], [], [], ..., []]

# 訪れた頂点を記録する配列を生成
# 値 0, 1, 2, ..., n を順番に要素として追加する
visit = []

# グラフの頂点を訪れたかどうかを管理する配列
# n 個の 0 を要素に持つ配列を生成
# まだ訪れていない頂点とリンクする要素を 0 とし、訪れた際にはその要素を 1 に変更する
done = Array.new(n, 0)  # => [0, 0, 0, 0, 0, ..., 0]

# 訪れた頂点として 0 を記録
# 頂点を記録する際、頂点の値 - 1 した値を要素として追加する
# そのように記録するのは、後ほど visit の要素を graph のインデックスとして使用するためであり、配列を扱う際は、添字(インデックス)が 0 から始まるので、便宜上このような操作をすることは多々ある
visit.push(0)

# 頂点を訪れた際、その頂点の値が(インデックスとして)示す done の要素を 0 から 1 にする
# 言い換えると、 done の要素の中から、順番がその頂点の値のものを 0 から 1 にする
done[0] = 1

# 与えられる各辺の両端の頂点を a, b として受け取り、それらを -1 し、二次元配列 graph のそれぞれの位置に、対応する頂点の値を追加する処理を n - 1 回繰り返す
(n - 1).times do
  a, b = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  graph[a].push(b)
  graph[b].push(a)
end

# 訪れた頂点の番号を記録するための繰り返し処理
# 訪れた頂点が n 個に達するまで処理を繰り返し行う
while visit.length != n
  # visit の末尾の要素(直前に訪れた頂点の値)を変数 now に代入
  now = visit[-1]
  # graph の中から、直前に訪れた頂点の位置 graph[now] の要素の数だけ繰り返し処理を行う
  # 線形グラフの両端が while の処理の対象となるループの最初と最後(0 と n - 1)のみ要素が 1 つで、それ以外のときは要素は 2 つ
  # よって、ブロック変数 i に代入される値は 0 もしくは 1
  graph[now].length.times do |i|
    # 頂点に達したかどうかを管理する配列 done を用いて、graph[now] の要素の中から次に達する頂点の値を確認するための if
    # この時点で、graph[now] の要素の数は 1 つ、もしくは 2 つであり、 1 つの場合、それは次の要素を指し示す値であり、 2 つの場合、片方は直前に達した頂点を表す値で、もう片方が次の要素を指し示す値
    # done[graph[now][i]] は times の繰り返しの中で done の添字として、直前に達した頂点を表す値を指定した場合は 1 を、次の要素を指し示す値を添字とした場合は 0 を返す
    if done[graph[now][i]] == 0
      # この時点で次の頂点に達したことになるので、達した頂点の値を visit に追加
      visit.push(graph[now][i])
      # 各頂点に達したかどうかを管理する done に、今達した頂点の位置の要素を 0 から 1 に変更する処理を行う
      done[graph[now][i]] = 1
    end
  end
end

visit.each do |v|
  puts v + 1
end

# -------------------------------------------------

# 以下のコードではタイムアウト

# 1 つの配列のみで管理している

n = gets.to_i

v = []
(n - 1).times do
  left, right = gets.split.map(&:to_i)
  v << [left, right]
end

another_index = v[0].index(1)
if another_index == 0
  pointer = v[0][1]
else
  pointer = v[0][0]
end

puts 1

v[0] = [0, 0]

count = 1
i = 0
while true
  if v[i].include?(pointer)
    puts pointer
    another_index = v[i].index(pointer)
    if another_index == 0
      pointer = v[i][1]
    else
      pointer = v[i][0]
    end
    
    count += 1
    if count == (n - 1)
      puts pointer
      break
    end
    
    v[i] = [0, 0]
    i = 0
  else
    i += 1
  end
end

# -------------------------------------------------

# 以下のコードではタイムアウト

n = gets.to_i

v = []
(n - 1).times do
  left, right = gets.split.map(&:to_i)
  v << [left, right]
end

pointer = 0
result = []

(n - 1).times do |i|
  if v[i].include?(1)
    result << 1

    v[i].each do |j|
      if j != 1
        pointer = j
      end
    end
    v.delete_at(i)
    break
  end
end

while v.length > 0
  v.length.times do |i|
    if v[i].include?(pointer)
      result << pointer

      v[i].each do |j|
        if j != pointer
          pointer = j
        end
      end
      v.delete_at(i)
      break
    end
  end
end

puts result