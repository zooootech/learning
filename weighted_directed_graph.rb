# 重みあり有向グラフの隣接行列と隣接リスト (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_graph_step4

# 隣接行列では指定の要素に重みを入れ、隣接リストでは頂点の番号と重みをセットで管理する必要があります。
# 隣接リストの実装では、可変長の二次元配列や、連想配列を使うと楽です。


n, m = gets.split.map(&:to_i)

g = Array.new(n).map { Array.new(n, 0) }  # 0 を要素に持つ n × n の配列(二次元配列) g を生成

h = Array.new(n){ [] }  # n 個の空の配列を要素として持つ配列(二次元配列) h を生成

m.times do
  a, b, k = gets.split.map(&:to_i)

  g[a - 1][b - 1] = k
  h[a - 1] << "#{b - 1}(#{k})"
end

g.each do |row|
  row.each do |num|
    print num
  end
  puts ""
end

h.each do |row|
  # sort_by はブロックの評価結果を <=> メソッドで比較することで、self を昇順にソートします。ソートされた配列を新たに生成して返します。
  # sort_by! は sort_by の破壊的バージョンで、 self を破壊的にソートし、self を返します。
  row.sort_by! {|v| v.to_i }.each do |num|
    print num
  end
  puts ""
end