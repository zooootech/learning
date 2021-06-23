# 隣接リスト (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_graph_step2

# 問題文の通りの実装をすればいいです。 ２ 次元の可変長配列を用いると実装が楽になります。
# ソートするのを忘れないように注意してください。

# 隣接リスト g を作り、隣接しているとき頂点の番号を出力します。

n, m = gets.split.map(&:to_i)

g = Array.new(n){ [] }

m.times do
  a, b = gets.split.map(&:to_i)

  g[a - 1] << b - 1
  g[b - 1] << a - 1

end

g.each do |row|

  # sort は配列の内容をソートします。要素同士の比較は <=> 演算子を使って行います。sort はソートされた配列を生成して返します。
  row.sort.each do |num|
    print num
  end
  puts ""
end