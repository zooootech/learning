# 区間の積 (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_twopointers_boss

# 問題文中に「連続する区間の最小の長さ」とあるのでしゃくとり法を念頭において考えます。
# まず、純粋に前から積を取っていき、積が K 以上になるまで先頭の要素を掛け、 K 以上のときは末尾の要素で積を割るというしゃくとり法が思いつくと思います。 しかし、この方法だと 0 が含まれていることによってうまく答えが出ません。
# 0 が含まれているときの対処
# 一度しゃくとり法の範囲に 0 が入ってしまうと、それ以降の積の値が全て 0 になってしまいます。
# Kが 0 より大きいので、積の値が 0 のとき、すなわちしゃくとり法の範囲に 0 があるかぎり条件を満たすことは絶対にありません。
# なので、一度しゃくとりの範囲内に 0 が入ってしまった時は、末尾を 0 の次の要素まで動かしてしまって良いです。
# こうすることで 0 があっても、それ以降のしゃくとりをうまく行うことができます。

# -------------------------------------------------

# しゃくとり法による解法 1

n, k = gets.chomp.split.map(&:to_i)

a = gets.chomp.split.map(&:to_i)

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

left = 0
right = 0
sum = 1

# 仮に k が 1 だった場合、 sum の初期値を 1 に設定していることや、以降の処理でマニュアルで sum に 1 を代入することで、right についての while の条件式で、ループから抜け出さないようにするための変数 flag_safe を定義
flag_safe = true  # 初期値は true にし、最初の right についての while の条件式の評価を真にする

# 区間の積が指定の値 k 以上になるまでは右端 right を +1 動かし（right の更新）、区間の積が指定の値 k 以上になったときは左端 left を +1 動かす（left の更新）
while left < n  # 左端 left についての while

  # 区間の左端 left に対する、条件（sum >= k）を満たす右端 right の最小値を求める繰り返し処理
  # 以下の while について、もし、 k == 1 、 sum == 1 だった場合、条件式が right < n && sum < k だけだと sum < k の部分で条件式の評価が偽となり処理が行われない
  # そこで、 right < n は必須の条件の上で、 (sum < k || flag_safe) を設定し、right == 0 から始まる最初のしゃくとりや、マニュアルで sum に 1 を代入した際に flag_safe という変数に true を代入し、条件式の評価を真にする
  while right < n && (sum < k || flag_safe)  # 右端 right についての while
    sum *= a[right]  # それまでの合計値（区間の積） sum に対象の要素 a[right] を掛けたものを自己代入
    right += 1  # sum に a[right] を掛け合わせても大丈夫なら right を動かす（right の更新）
    if k <= sum || sum == 0  # a の要素に 0 が含まれていた場合、しゃくとり法の範囲に 0 があるかぎり条件を満たすことは絶対にないので、一度しゃくとり法の範囲内に 0 が入ってしまった時は、一旦 while を抜け、左端 left を 0 の次の要素まで動かす
      break
    end
  end
  
  # sum < k の状態で、right についての while を抜けるということは、 right が a の右端に達したということ
  # sum < k の場合、これ以上 left を進めてもダメなので、 left についての while を break する
  # sum == 0 の場合でも、 right についての while を break するため、条件式に sum != 0 を含める
  break if sum != 0 && sum < k
  
  flag_safe = false  # sum が 1 になったとき以外は基本 false に設定

  if sum != 0  # sum が 0 以外のとき、つまり、right についての while において、 k <= sum となって break したとき
    result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する
    sum /= a[left]  # 左端 left のみがインクリメントされるので sum を左端の要素の値 a[left] で割る
    left += 1  # left をインクリメント

    # ここで left と right が重なるということは、 a において、条件を満たす最小の部分列の長さが求められたということになる（それはつまり 1）
    # なので、この時点で left についての while を抜け、全体の処理を終える
    # この if をこの位置に組み込むのは、 sum が 0 のときに行われる下の else 以下の処理の中で、マニュアルで left を right に位置に動かすことで、意図せず以下 if の処理が行われてしまうため
    if right == left  # leftをインクリメントした際、right と重なった場合
      break
    end
  else  # sum が 0 になったとき
    left = right  # left に right の値を代入し、左端 left を 0 の次の要素（0 の一つ右の要素）まで動かすことで、 0 をしゃくとり法の範囲外にする
    sum = 1  # 次に行われる right についての while の処理において、掛け算の対象となる次の要素 a[right] の値を sum に入れたいため、 sum に 1 を代入
    flag_safe = true
  end
end

puts result

# -------------------------------------------------

# しゃくとり法による解法 2

n, k = gets.chomp.split.map(&:to_i)

a = gets.chomp.split.map(&:to_i)

# 区間の長さの最小値を代入する変数を定義
result = n + 1  # 上界を入れておく

left = 0
right = 0
sum = 1

# 仮に k が 1 だった場合、 sum の初期値を 1 に設定していることや、以降の処理でマニュアルで sum に 1 を代入することで、right についての while の条件式で、ループから抜け出さないようにするための変数 flag_safe を定義
flag_safe = true  # 初期値は true にし、最初の right についての while の条件式の評価を真にする

# 区間の積が指定の値 k 以上になるまでは右端 right を +1 動かし（right の更新）、区間の積が指定の値 k 以上になったときは左端 left を +1 動かす（left の更新）
while left < n  # 左端 left についての while

  # 以下の while について、もし、 k == 1 、 sum == 1 だった場合、条件式が right < n && sum < k だけだと sum < k の部分で条件式の評価が偽となり処理が行われない
  # そこで、 right < n は必須の条件の上で、 (sum < k || flag_safe) を設定し、right == 0 から始まる最初のしゃくとりや、マニュアルで sum に 1 を代入した際に flag_safe という変数に true を代入し、条件式の評価を真にする
  while right < n && (sum < k || flag_safe)  # 右端 right についての while
    sum *= a[right]  # それまでの合計値（区間の積） sum に対象の要素 a[right] を掛けたものを自己代入
    right += 1  # sum に a[right] を掛け合わせても大丈夫なら right を動かす（right の更新）
    if k <= sum || sum == 0  # a の要素に 0 が含まれていた場合、しゃくとり法の範囲に 0 があるかぎり条件を満たすことは絶対にないので、一度しゃくとり法の範囲内に 0 が入ってしまった時は、一旦 while を抜け、左端 left を 0 の次の要素まで動かす
      break
    end
  end
  
  # sum < k の状態で、right についての while を抜けるということは、 right が a の右端に達したということ
  # sum < k の場合、これ以上 left を進めてもダメなので、 left についての while を break する
  # sum == 0 の場合でも、 right についての while を break するため、条件式に sum != 0 を含める
  break if sum != 0 && sum < k
  
  flag_safe = false  # sum が 1 になったとき以外は基本 false に設定

  if sum != 0  # sum が 0 以外のとき、つまり、right についての while において、 k <= sum となって break したとき
    result = [result, right - left].min  # それまでの部分列の値 result と、新しく導いた部分列の値 rigth - left を比較し、小さい方を result に代入する
    sum /= a[left]  # 左端 left のみがインクリメントされるので sum を左端の要素の値 a[left] で割る
    left += 1  # left をインクリメント

    # left と right が重なった上で、もし次の right についての while の処理が行われない状況（つまり、 k <= sum）の場合、 right のインクリメントが行われず、 left が right を越えることになる
    # つまり、ここで left と right が重なるということは、その要素 a[left - 1] が含まれている区間（範囲）の中で、条件を満たす最小の長さが求められたということになる（それはつまり 1）
    # このままだと次の範囲でのしゃくとり法に移行できないため、マニュアルで right を動かす
    # この if をこの位置に組み込むのは、sum が 0 のときに行われる下の else 以下の処理の中で、マニュアルで left を right に位置に動かすため、仮に、その処理が行われた後にこの if を記述すると、意図しない right += 1 が行われてしまい、要素を一つ飛ばすことになってしまうため
    if right == left  # leftをインクリメントした際、right と重なった場合
      right += 1  # right をインクリメント
    end
  else  # sum が 0 になったとき
    left = right  # left に right の値を代入し、左端 left を 0 の次の要素（0 の一つ右の要素）まで動かすことで、 0 をしゃくとり法の範囲外にする
    sum = 1  # 次に行われる right についての while の処理において、掛け算の対象となる次の要素 a[right] の値を sum に入れたいため、 sum に 1 を代入
    flag_safe = true
  end
end

puts result

# -------------------------------------------------

# しゃくとり法による解法 1 （コメントなし）

n, k = gets.chomp.split.map(&:to_i)

a = gets.chomp.split.map(&:to_i)

result = n + 1
left = 0
right = 0
sum = 1

flag_safe = true

while left < n
  while right < n && (sum < k || flag_safe)
    sum *= a[right]
    right += 1
    if k <= sum || sum == 0
      break
    end
  end
  
  break if sum != 0 && sum < k 
  
  flag_safe = false

  if sum != 0
    result = [result, right - left].min
    sum /= a[left]
    left += 1
    if right == left
      break
    end
  else
    left = right
    sum = 1
    flag_safe = true
  end
end

puts result

# -------------------------------------------------

# しゃくとり法による解法 2 （コメントなし）

n, k = gets.chomp.split.map(&:to_i)

a = gets.chomp.split.map(&:to_i)

result = n + 1
left = 0
right = 0
sum = 1

flag_safe = true

while left < n
  while right < n && (sum < k || flag_safe)
    sum *= a[right]
    right += 1
    if k <= sum || sum == 0
      break
    end
  end
  
  break if sum != 0 && sum < k 
  
  flag_safe = false

  if sum != 0
    result = [result, right - left].min
    sum /= a[left]
    left += 1
    if right == left
      right += 1
    end
  else
    left = right
    sum = 1
    flag_safe = true
  end
end

puts result

# -------------------------------------------------

n, k = gets.chomp.split.map(&:to_i)

numbers = gets.chomp.split.map(&:to_i)

def mul_list(data)  # 仮引数 data には left と right をもとに numbers から切り取った部分配列が渡される
  result = 1  # 要素の値を掛け合わせたていき、その合計（区間の積）を入れる変数 result の初期値を 1 に設定
  for i in data  # numbers から切り取った部分配列 data の要素が一つずつ取り出され、その値を i に代入する繰り返し処理
    result *= i  # それまでの合計値 result に対象の要素 i を掛けたものを自己代入
  end
  return result  # result で、繰り返し処理が終わった後の result を戻り値として返す
end

# 区間の長さの最小値を代入する変数を定義
count = n + 1  # 上界を入れておく

left = 0
right = 0
while true
  # right が 要素の数 を越えた場合、もしくは、左端 left が 右端 right を越えた場合、ループを抜ける
  # ここでいう左端 left が 右端 right を越えた場合というのは、区間の最小の長さ（最短の区間）が求められたことを意味している
  # それゆえ、それ以上繰り返し処理をする必要がないため、break で while を抜ける
  if right >= n || left > right
    break
  end

  # 上で定義した mul_listメソッドを呼び出し、引数には left と right をもとに numbers から切り取った部分配列を指定し、その戻り値 result が k 以上の場合、そのときの区間の長さ right - left + 1 が、それまでの区間の長さ count より短ければ、 count に right - left + 1 を代入する
  if mul_list(numbers.slice(left..right)) >= k  # 引数に left と right をもとに numbers から切り取った部分配列を指定し、 mul_listメソッドを呼び出し、戻り値 result が k 以上の場合
    if right - left + 1 < count  # そのときの区間の長さ right - left + 1 の値が、それまでの区間の長さ count の値より小さい場合
      count = right - left + 1  # count に right - left + 1 を代入する
    end
    left += 1  # そのときの区間の積 result が k 以上のとき left をインクリメントし（left の更新）、その left の値に対する条件（result >= k）を満たす right の最小値を求めるための探索を試みる
  # 一度しゃくとりの範囲内に 0 が入ってしまった時は、左端 left を 0 の次の要素まで動かす
  elsif numbers[right] == 0  # 掛け合わせる要素が 0 の場合 
    left = right + 1 # left を 0 の次の要素の位置まで動かす
    right += 1  # right もインクリメントし、 0 の次の要素の位置に動かす
  else  # result < k かつ、範囲内に 0 が存在しない場合
    right += 1  # right をインクリメント
  end
end

puts count