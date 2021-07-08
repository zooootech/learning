# 陣取りゲーム (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_camp_boss

# スタート位置が 2 箇所の幅優先探索を行うのがメインの処理になります。
# queueを 2 つ用意して、距離を管理しながら交互に陣地を広げていく、もしくは幅優先探索では距離の昇順にマス目が入ることを用いて、
# 1 つのキューに、先攻のスタート地点、後攻のスタート地点の順に入れ、幅優先探索をすることでもうまくいきます。
# 最後に各プレイヤーのマス目を数えて、勝敗を決定します。


h, w = gets.chomp.split.map(&:to_i)

first_player = gets.chomp

players = ["A", "B"]

# index(val) は指定された val と == で等しい最初の要素の位置を返します。等しい要素がひとつもなかった場合は nil を返します。
# index {|v| v > 0} のようにブロックが与えられた場合には、各要素を引数として順にブロックを実行し、ブロックが真を返した最初の要素の位置を返します。一つも真にならなかった場合は nil を返します。
now_player = players.index { |v| v == first_player }

array = []
for i in 1..h
  array << gets.chomp
end

a_paint = []
b_paint = []

distance = 1  # それぞれの陣地に関する距離（数値はなんでもいいが、ここでは初期値を 1 に設定）

for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "A"
      a_paint << [y, x, distance]
    end
    if array[y][x] == "B"
      b_paint << [y, x, distance]
    end
  end
end

while a_paint.size > 0 || b_paint.size > 0
  if players[now_player] == "A" && a_paint.size != 0
    character = "A"
    y, x, d = a_paint.delete_at(0)
  elsif players[now_player] == "B" && b_paint.size != 0
    character = "B"
    y, x, d = b_paint.delete_at(0)
  end

  paint = []

  if 0 < y && array[y - 1][x] == "."
    array[y - 1][x] = character
    paint << [y - 1, x, d + 1]
  end
  if y < h - 1 && array[y + 1][x] == "."
    array[y + 1][x] = character
    paint << [y + 1, x, d + 1]
  end
  if 0 < x && array[y][x - 1] == "."
    array[y][x - 1] = character
    paint << [y, x - 1, d + 1]
  end
  if x < w - 1 && array[y][x + 1] == "."
    array[y][x + 1] = character
    paint << [y, x + 1, d + 1]
  end

  if paint.size != 0
    paint.each do |p|
      if players[now_player] == "A"
        a_paint << p
      else
        b_paint << p
      end
    end
  end

  # flag_pass = true
  # if players[now_player] == "A"
  #   a_paint.size.times do |now_index|
  #     if a_paint[now_index][2] == d
  #       flag_pass = false
  #       break
  #     end
  #   end
  # else
  #   b_paint.size.times do |now_index|
  #     if b_paint[now_index][2] == d
  #       flag_pass = false
  #       break
  #     end
  #   end
  # end

  flag_pass = true
  if players[now_player] == "A" && a_paint.size != 0 && a_paint[0][2] == d
    flag_pass = false
  elsif players[now_player] == "B" && b_paint.size != 0 && b_paint[0][2] == d
    flag_pass = false
  end

  now_player = (now_player + 1) % 2 if flag_pass
end


a_count = 0
b_count = 0
for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "A"
      a_count += 1
    end
    if array[y][x] == "B"
      b_count += 1
    end
  end
end

winner = "A"
if a_count < b_count
  winner = "B"
end

puts "#{a_count} #{b_count}"
puts winner

# -------------------------------------------------

h, w = gets.chomp.split.map(&:to_i)
ab = gets.chomp

array = []
for i in 1..h
  array << gets.chomp
end

count = 0  # 配列 ab_point の添字
aadd = 0
sums = [1, 1]  #  A と B それぞれの陣地にしたマスの合計値
flag_pass = true
ab_point = [[], []]

if ab == "B"
  count += 1  # プレイヤーを B に変更
  aadd += 1  # 後の処理で、 A のキューに要素として追加する配列の添字が 2 の要素。距離を表す。先攻が B の場合、 A の最初のターンでの距離を 1 にしておくのは、後でターン変更の判定を行うときの条件として用いる際に、帳尻を合わせるため
end

for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "A"
      ab_point[0] << [y, x, aadd]
    end
    if array[y][x] == "B"
      ab_point[1] << [y, x, 0]
    end
  end
end

while ab_point[0].size > 0 || ab_point[1].size > 0
  if ab_point[count % 2].size == 0  # どちらかのキューの要素の数が 0 のとき
    count += 1  # プレイヤーを変更
    flag_pass = false  # 下に記述してある プレイヤーを変更すべきかを検証する if の処理を行えないようにする。なぜなら、この時点で A, B のどちらかは新たに陣地にできるマスが無く、以降の操作ができない。つまり今後プレイヤーを変更させるための処理を行う必要がなくなるため（片方のキューの要素がなくなったことがそれを証明している）。
  end

  # ここで現在のプレイヤーのキューの先頭の要素( ab_point[count % 2][0] )を x, y, n に代入する
  y, x, n = ab_point[count % 2][0]

  # 上で n に代入した数値（距離）が、それまで代入していた値より 1 大きい場合、それはそのプレイヤーの、それまでの距離における操作を終えたことを意味し、プレイヤーを交代させる必要がある
  # 要は、その距離 n で行うべき操作が終了したことを示唆している
  # 距離 n は操作を行う回数の範囲の指標となるものと捉えることが重要
  # count はプレイヤーを切り替えるための変数で、切り替わるごとに +1 される
  # count は A, B の 2 人どちらのターンの時にも、ターン終了の際に値が増加する変数（A, B を共通で管理している変数）
  # 一方 n はそれぞれのキューで管理している要素を代入した変数なので、 count の値と n の値を比較する際は count を 2 で割ってあげる必要がある
  # count を 2 で割ることで、 1 人分の回ってきたターンの回数を表す値となる（何ターン目かが分かる）
  # そのプレイヤーが現在何ターン目なのかを導いた上で、ターンの値と距離の値が等しい時に操作が可能という仕組みを利用し、以下の条件分岐を記述
  # 言い換えると、そのターン内で操作可能な指定距離の値を超えた値が n に代入されている場合、そのターンでの操作を終了させる
  # n については、数値が増加したかどうかに注目する
  if count / 2 < n && flag_pass
    count += 1  # プレイヤーを変更
    y, x, n = ab_point[count % 2][0]  # ターンが回ってきたプレイヤーのキューの先頭の要素を x, y, n に代入
  end

  ab_point[count % 2].delete_at(0)
  if count % 2 == 0
    ab = "A"
  else
    ab = "B"
  end

  if 0 < y && array[y - 1][x] == "."
    array[y - 1][x] = ab
    sums[count % 2] += 1
    ab_point[count % 2] << [y - 1, x, n + 1]
  end
  if y < h - 1 && array[y + 1][x] == "."
    array[y + 1][x] = ab
    sums[count % 2] += 1
    ab_point[count % 2] << [y + 1, x, n + 1]
  end
  if 0 < x && array[y][x - 1] == "."
    array[y][x - 1] = ab
    sums[count % 2] += 1
    ab_point[count % 2] << [y, x - 1, n + 1]
  end
  if x < w - 1 && array[y][x + 1] == "."
    array[y][x + 1] = ab
    sums[count % 2] += 1
    ab_point[count % 2] << [y, x + 1, n + 1]
  end
end

puts "#{sums[0]} #{sums[1]}"

if sums[0] > sums[1]
  result = "A"
else
  result = "B"
end

puts result

# -------------------------------------------------

h, w = gets.chomp.split.map(&:to_i)
first_player = gets.chomp

array = []
for i in 1..h
  array << gets.chomp
end

now_player = 0  # プレイヤーを管理する変数（ 0 のとき A 、 1 のとき B ）
sums = [1, 1]  # A と B それぞれの陣地にしたマスの合計値

a_paint = []  # A のキュー
b_paint = []  # B のキュー

distance = 1  #  それぞれの陣地に関する距離（数値はなんでもいいが、ここでは初期値を 1 に設定）

if first_player == "B"
  now_player = 1
end

# スタート時点の座標と操作回数を それぞれのキュー に追加します。
for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "A"
      a_paint << [y, x, distance]
    end
    if array[y][x] == "B"
      b_paint << [y, x, distance]
    end
  end
end

# A のキューである配列 a_paint もしくは B のキューのである配列 b_paint の要素がある限り繰り返し処理が行われる
# 言い換えると A のキューと B のキューが空になるまで、処理を繰り返す
while a_paint.size > 0 || b_paint.size > 0
  flag_pass1 = true  # プレイヤーを変更すべきかどうかを判定する if （条件分岐）の条件式として用いる。初期値は true
  if a_paint.size == 0  # A のキューが空になった場合、
    now_player = 1  # プレイヤー B のターンに変更
    flag_pass1 = false  # 下に記述してある、プレイヤーを変更すべきかどうかを判定する if の処理を行わないようにするため、値を false に変更
  elsif b_paint.size == 0  # B のキューが空になった場合、
    now_player = 0  # プレイヤー A のターンに変更
    flag_pass1 = false  # 下に記述してある、プレイヤーを変更すべきかどうかを判定する if の処理を行わないようにするため、値を false に変更
  end

  if now_player == 0
    character = "A"
    y, x, d = a_paint.delete_at(0)  # A のキューから先頭の要素を取り除き、取り出した値をそれぞれ y, x, d に代入
  elsif now_player == 1
    character = "B"
    y, x, d = b_paint.delete_at(0)  # B のキューから先頭の要素を取り除き、取り出した値をそれぞれ y, x, d に代入
  end
  
  paint = []

  if 0 < y && array[y - 1][x] == "."
    array[y - 1][x] = character
    sums[now_player] += 1
    paint << [y - 1, x, d + 1]
  end
  if y < h - 1 && array[y + 1][x] == "."
    array[y + 1][x] = character
    sums[now_player] += 1
    paint << [y + 1, x, d + 1]
  end
  if 0 < x && array[y][x - 1] == "."
    array[y][x - 1] = character
    sums[now_player] += 1
    paint << [y, x - 1, d + 1]
  end
  if x < w - 1 && array[y][x + 1] == "."
    array[y][x + 1] = character
    sums[now_player] += 1
    paint << [y, x + 1, d + 1]
  end

  if paint.size != 0
    paint.each do |p|
      if now_player == 0
        a_paint << p
      else
        b_paint << p
      end
    end
  end

  if flag_pass1
    flag_pass2 = true
    # 以下の if の条件式に、それぞれのキューの要素数が空ではないか（ a_paint.size > 0 と b_paint.size > 0 のこと）を含めていないとエラーが起こる
    # これより上に記述してある 条件分岐において、それぞれのキューの先頭の要素を x, y, d に代入するときに、その要素をキューから取り除いている
    # それにより、処理を繰り返す中でいずれは A, B どちらかのキューがなくなった（操作可能回数の上限に達した）状態でこの 条件分岐を迎えることになる
    # その際、例えば A のキューがない状態でこの条件分岐を迎えた場合、 a_paint[0][2] == d について考えると、まず a_paint[0] == nil が成り立つ
    # a_paint[0] == nil ということは a_paint[0][2] は nil[2] ということになる
    # nil に対して [] は使用できないため、 NoMethodError が起こる
    # そこで、条件式に a_paint.size > 0 を a_paint[0][2] == d の前に記述することで a_paint.size > 0 の真偽値が false と分かった時点で条件式の評価を終了させるのでエラーを回避することができる
    # && は左辺を評価し、結果が偽であった場合はその値(つまり nil か false) を返します。左辺の評価結果が真であった場合には右辺を評価しその結果を返します。
    # ここでは、それぞれのキューが空ではなく、先頭に控えている要素（配列）の、添字が 2 に当たる要素が それまでの操作回数 d （距離もしくは、ターンを表す値と認識すると分かりやすい）と等しい場合（イメージとしては、同じターンを表す数値が、キューに残っている場合）は、まだそのプレイヤーに操作を続けさせる
    # キューの中の、ある 1 つの要素の中身は、添字 0 の要素が y に代入にする値、添字 1 の要素が x に代入にする値、添字 2 の要素が d に代入にする値となっている
    if now_player == 0 && a_paint.size > 0 && a_paint[0][2] == d
      flag_pass2 = false
    elsif now_player == 1 && b_paint.size > 0 && b_paint[0][2] == d
      flag_pass2 = false
    end
  end

  # 上の if でプレイヤーの操作を続けさせると判定した場合は、以下の処理を行わない
  now_player = (now_player + 1) % 2 if flag_pass2
end

puts "#{sums[0]} #{sums[1]}"

if sums[0] > sums[1]
  result = "A"
else
  result = "B"
end

puts result

# -------------------------------------------------

