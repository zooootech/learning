# 最短の区間 (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_twopointers_step3

# 区間の前と後ろを全探索すると計算量がO(N^2)になって実行時間制限に間に合わなくなってしまいます。
# そこで しゃくとり法 というアルゴリズムを用います。
# しゃくとり法についてはこのpaiza開発日誌の過去の記事に詳しく書いてあるので参照してみてください。
# しゃくとり法の概要は次の通りです。
# 条件を満たすような区間を保持したまま、区間がより短く（長く）なるように操作する。
# 更新した区間が条件を満たしている時は答えとなる可能性があるので、答えの候補と比較する。
# 条件を満たしていない場合は区間を長く（短く）する。
# これらの操作を繰り返し、これ以上区間を移動できなくなったら、終了する。

# 今回の問題では、区間の末尾と先頭の更新条件は次の通りになります。
# 末尾（左端）++ : 区間の総和が M を超えたとき
# 先頭（右端）++ : 区間の総和が M 以下のとき

# -------------------------------------------------

# しゃくとり法による解法 1

n, m = gets.chomp.split.map(&:to_i)

a = gets.chomp.split.map(&:to_i)

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

right = 0
sum = 0
flag_exist = true  # 部分列が存在するかどうかを判定する変数を定義

# 区間の左端 left で場合分け
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
n.times do |left|

  # 区間の左端 left に対する、条件を満たす右端 right の最小値を求める繰り返し処理
  while right < n && sum < m  # right が要素の数 n 未満、かつ、要素の和 sum が指定の値 m 未満の場合、繰り返し処理を行う
    # sum に a[right] を加えても大丈夫なら right を動かす
    sum += a[right]
    right += 1
  end

  # 上記 until の評価の末、それでも要素の和 sum が指定の値 m 以上にならなかった場合、これ以上 left を進めても m <= sum にはならないので、 upto のループを抜ける
  if sum < m
    # その際、もし左端が 0 の場合、 a の中には指定の値 m を越える部分列は存在しないことになるので、 -1 を出力するための処理を行う
    if left == 0
      flag_exist = false
    end
    break
  end

  # 要素の和 sum が指定の値 m 以上になるときの、左端 left に対する右端 right を上記の while で求めたため、以下で区間の長さの比較をし、小さい方を result に代入 
  result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する

  # right が left に重なるということは、最短の区間が求められたということなので、 times の繰り返し処理を終える
  if right == left
    break
  else
    sum -= a[left]  # 左端 left のみがインクリメントされるので sum から左端の要素の値 a[left] を引く
  end
end

if flag_exist
  puts result
else
  puts -1
end

# -------------------------------------------------

# しゃくとり法による解法 2

n, m = gets.chomp.split.map(&:to_i)

a = gets.chomp.split.map(&:to_i)

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

right = 0
sum = 0
flag_exist = true  # 部分列が存在するかどうかを判定する変数を定義

# 区間の左端 left で場合分け
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
n.times do |left|

  # 区間の左端 left に対する、条件を満たす右端 right の最小値を求める繰り返し処理
  while right < n && sum < m  # right が要素の数 n 未満、かつ、要素の和 sum が指定の値 m 未満の場合、繰り返し処理を行う
    # sum に a[right] を加えても大丈夫なら right を動かす
    sum += a[right]
    right += 1
  end

  # 上記 until の評価の末、それでも要素の和 sum が指定の値 m 以上にならなかった場合、これ以上 left を進めても m <= sum にはならないので、 upto のループを抜ける
  if sum < m
    # その際、もし左端が 0 の場合、 a の中には指定の値 m を越える部分列は存在しないことになるので、 -1 を出力するための処理を行う
    if left == 0
      flag_exist = false
    end
    break
  end

  # 要素の和 sum が指定の値 m 以上になるときの、左端 left に対する右端 right を上記の while で求めたため、以下で区間の長さの比較をし、小さい方を result に代入 
  result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する

  # left をインクリメントする準備
  sum -= a[left]  # 左端 left のみがインクリメントされるので sum から左端の要素の値 a[left] を引く
end

if flag_exist
  puts result
else
  puts -1
end

# -------------------------------------------------

# しゃくとり法による解法 3

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

right = 0
sum = 0
flag_exist = true  # 部分列が存在するかどうかを判定する変数を定義

# 区間の左端 left で場合分け
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
# upto(max) {|n| ... } は self から max まで 1 ずつ増やしながら繰り返します。 self > max であれば何もしません。
0.upto(n - 1) do |left|

  # 区間の左端 left に対する、条件を満たす右端 right の最小値を求める繰り返し処理
  until n <= right || m <= sum  # right が要素の数 n 以上になる、もしくは、要素の和 sum が指定の値 m 以上になった場合、 until のループを抜ける
    # sum に a[right] を加えても大丈夫なら right を動かす
    sum += a[right]
    right += 1
  end

  # 上記 until の評価の末、それでも要素の和 sum が指定の値 m 以上にならなかった場合、これ以上 left を進めても m <= sum にはならないので、 upto のループを抜ける
  if sum < m
    # その際、もし左端が 0 の場合、 a の中には指定の値 m を越える部分列は存在しないことになるので、 -1 を出力するための処理を行う
    if left == 0
      flag_exist = false
    end
    break
  end

  # 要素の和 sum が指定の値 m 以上になるときの、左端 left に対する右端 right を上記の until で求めたため、以下で区間の長さの比較をし、小さい方を result に代入 
  result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する

  # left をインクリメントする準備
  sum -= a[left]  # 左端 left のみがインクリメントされるので sum から左端の要素の値 a[left] を引く
end

if flag_exist
  puts result
else
  puts -1
end

# -------------------------------------------------

# しゃくとり法による解法 4

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

right = 0
sum = 0
flag_exist = true  # 部分列が存在するかどうかを判定する変数を定義

# 区間の左端 left で場合分け
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
# upto(max) {|n| ... } は self から max まで 1 ずつ増やしながら繰り返します。 self > max であれば何もしません。
0.upto(n - 1) do |left|

  # 区間の左端 left に対する、条件を満たす右端 right の最小値を求める繰り返し処理
  while right < n && sum < m  # right が要素の数 n 未満、かつ、要素の和 sum が指定の値 m 未満の場合、繰り返し処理を行う
    # sum に a[right] を加えても大丈夫なら right を動かす
    sum += a[right]
    right += 1
  end

  # 上記 while の評価の末、それでも要素の和 sum が指定の値 m 以上にならなかった場合、これ以上 left を進めても m <= sum にはならないので、 upto のループを抜ける
  if sum < m
    # その際、もし左端が 0 の場合、 a の中には指定の値 m を越える部分列は存在しないことになるので、 -1 を出力するための処理を行う
    if left == 0
      flag_exist = false
    end
    break
  end

  # 要素の和 sum が指定の値 m 以上になるときの、左端 left に対する右端 right を上記の while で求めたため、以下で区間の長さの比較をし、小さい方を result に代入
  result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する

  # left をインクリメントする準備
  sum -= a[left]  # 左端 left のみがインクリメントされるので sum から左端の要素の値 a[left] を引く
end

if flag_exist
  puts result
else
  puts -1
end

# -------------------------------------------------

# しゃくとり法による解法 5

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

right = 0
sum = 0
flag_exist = true  # 部分列が存在するかどうかを判定する変数を定義

# 区間の左端 left で場合分け
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
(0..(n - 1)).each do |left|

  # 区間の左端 left に対する、条件を満たす右端 right の最小値を求める繰り返し処理
  while right < n && sum < m  # right が要素の数 n 未満、かつ、要素の和 sum が指定の値 m 未満の場合、繰り返し処理を行う
    # sum に a[right] を加えても大丈夫なら right を動かす
    sum += a[right]
    right += 1
  end

  # 上記 while の評価の末、それでも要素の和 sum が指定の値 m 以上にならなかった場合、これ以上 left を進めても m <= sum にはならないので、 upto のループを抜ける
  if sum < m
    # その際、もし左端が 0 の場合、 a の中には指定の値 m を越える部分列は存在しないことになるので、 -1 を出力するための処理を行う
    if left == 0
      flag_exist = false
    end
    break
  end

  # 要素の和 sum が指定の値 m 以上になるときの、左端 left に対する右端 right を上記の while で求めたため、以下で区間の長さの比較をし、小さい方を result に代入
  result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する

  # left をインクリメントする準備
  sum -= a[left]  # 左端 left のみがインクリメントされるので sum から左端の要素の値 a[left] を引く
end

if flag_exist
  puts result
else
  puts -1
end

# -------------------------------------------------

# しゃくとり法による解法 6

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

right = 0
sum = 0
flag_exist = true  # 部分列が存在するかどうかを判定する変数を定義

# 区間の左端 left で場合分け
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
(0...n).each do |left|

  # 区間の左端 left に対する、条件を満たす右端 right の最小値を求める繰り返し処理
  while right < n && sum < m  # right が要素の数 n 未満、かつ、要素の和 sum が指定の値 m 未満の場合、繰り返し処理を行う
    # sum に a[right] を加えても大丈夫なら right を動かす
    sum += a[right]
    right += 1
  end

  # 上記 while の評価の末、それでも要素の和 sum が指定の値 m 以上にならなかった場合、これ以上 left を進めても m <= sum にはならないので、 upto のループを抜ける
  if sum < m
    # その際、もし左端が 0 の場合、 a の中には指定の値 m を越える部分列は存在しないことになるので、 -1 を出力するための処理を行う
    if left == 0
      flag_exist = false
    end
    break
  end

  # 要素の和 sum が指定の値 m 以上になるときの、左端 left に対する右端 right を上記の while で求めたため、以下で区間の長さの比較をし、小さい方を result に代入
  result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する

  # left をインクリメントする準備
  sum -= a[left]  # 左端 left のみがインクリメントされるので sum から左端の要素の値 a[left] を引く
end

if flag_exist
  puts result
else
  puts -1
end

# -------------------------------------------------

# しゃくとり法による解法 7

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

right = 0
sum = 0
flag_exist = true  # 部分列が存在するかどうかを判定する変数を定義

# 区間の左端 left で場合分け
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
# upto(max) {|n| ... } は self から max まで 1 ずつ増やしながら繰り返します。 self > max であれば何もしません。
0.upto(n - 1) do |left|

  # 区間の左端 left に対する、条件を満たす右端 right の最小値を求める繰り返し処理
  until n <= right || m <= sum  # right が要素の数 n 以上になる、もしくは、要素の和 sum が指定の値 m 以上になった場合、 until のループを抜ける
    # sum に a[right] を加えても大丈夫なら right を動かす
    sum += a[right]
    right += 1
  end

  # 上記 until の評価の末、それでも要素の和 sum が指定の値 m 以上にならなかった場合、これ以上 left を進めても m <= sum にはならないので、 upto のループを抜ける
  if sum < m
    # その際、もし左端が 0 の場合、 a の中には指定の値 m を越える部分列は存在しないことになるので、 -1 を出力するための処理を行う
    if left == 0
      flag_exist = false
    end
    break
  end

  # 要素の和 sum が指定の値 m 以上になるときの、左端 left に対する右端 right を上記の until で求めたため、以下で区間の長さの比較をし、小さい方を result に代入
  result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する

  # left をインクリメントする準備
  if right == left  # right が left に重なったら right も動かす
    right += 1
  else
    sum -= a[left]  # 左端 left のみがインクリメントされるので sum から左端の要素の値 a[left] を引く
  end
end

if flag_exist
  puts result
else
  puts -1
end

# -------------------------------------------------

# 累積和による解法 1

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

# 累積和の前処理
s = [0]
n.times do |i|
  s[i + 1] = s[i] + a[i]
end

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

left = 0
right = 0

# 累積和表配列 s を使って条件を満たす区間の長さを算出し、それが最短の長さの場合、 result に代入するループ
# 区間和が指定の値 m 以上になるまでは右端 right を +1 動かし（right の更新）、区間和が指定の値 m 以上になったときは左端 left を +1 動かす（left の更新）
while true
  break if n <= right  # 右端 right が要素の数（配列の長さ） n 以上になった場合、ループを抜ける

  # 累積和表配列 s は、各地点での 1 番目(s[1])からの合計値となるので、「知りたい区間の末尾 - 知りたい区間の先頭の一つ手前」を行うと、知りたい区間の要素の和を求める事ができる
  if s[right + 1] - s[left] >= m
    result = [result, right - left + 1].min
    left += 1
  else
    right += 1
  end
end

# result が最初に定義した値と等しい場合、解がないため count に -1 を代入
if result == n + 1
  result = -1
end

puts result

# -------------------------------------------------

# 累積和による解法 2

n, m = gets.chomp.split.map(&:to_i)

a = []
a << gets.chomp.split.map(&:to_i)
a.flatten!

# 累積和の前処理
s = []
s[0] = 0
n.times do |i|
  s[i + 1] = s[i] + a[i]
end

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

left = 0
right = 0

# 累積和表配列 s を使って条件を満たす区間の長さを算出し、それが最短の長さの場合、 result に代入するループ
while right < n  # 右端 right が要素の数（配列の長さ） n 未満の場合、繰り返し処理を行う

  # 累積和表配列 s は、各地点での 1 番目(s[1])からの合計値となるので、「知りたい区間の末尾 - 知りたい区間の先頭の一つ手前」を行うと、知りたい区間の要素の和を求める事ができる
  if s[right + 1] - s[left] >= m  # ある区間での要素の和が、指定の値 m より大きいとき
    if right - left + 1 < result  # その区間の長さが、それまでの区間の最短 result より長い場合
      result = right - left + 1  # result にその区間の長さを代入する
    end
    left += 1  
  else
    right += 1
  end
end

# result が最初に定義した値と等しい場合、解がないため count に -1 を代入
if result == n + 1
  result = -1
end

puts result