# へび (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_mapmove_boss

# -------------------------------------------------

# 「移動できなくなったときに移動を終了する」 → 移動できなくなった時点でマップを出力しプログラムを終了する。
# 「移動先に自分の体があったときも移動を終了」 → map[移動後のy座標][移動後のx座標]!='*' が移動できる条件になる。


# リスト directions と、カウント変数 now_direction で移動方向の管理をしています。
# リスト time_lr と、カウント変数 time_index で次回の時間と方角を表します。
# times メソッドのブロック変数 t_now を時刻を表す変数とし、方向転換の時刻になったら方角を変え time_index += 1 とします。
# 移動できるようなら array[sy][sx] = "*" とマスを書き換え、できないようならループを抜けます。

h, w, sy, sx, n = gets.chomp.split.map(&:to_i)

array = []
for i in 1..h
  array.push(gets.chomp)
end

directions = ["N", "E", "S", "W"]
now_direction = 0  # 配列 directions の添字として使用する

time_lr = []
for i in 1..n
  time_lr.push(gets.chomp.split)
end

array[sy][sx] = "*"

time_index = 0

100.times do |t_now|
  # 以下の if 文において、time_index < n を条件にするのは、t_now.to_s == time_lr[time_index][0] だけだとエラーが起こるためである
  # 繰り返し処理の中で、方向転換を全てしきったタイミング (time_index == n - 1 のとき）にて、さらにそこから time_index += 1 が行われ、次の繰り返し処理では time_index == n の状態で始まることになる
  # そのタイミングで time_lr[time_index][0] について考えると、 time_lr の 1 つ目の添字に n の値を代入した場合、 time_lr には n - 1 番目までの要素しかないため、 time_lr[n] から得られる値は nil になる
  # time_lr[n] == nil のとき、time_lr[n][0] という記述は nil に添字を指定していることになるため、エラーが起こる
  # なので、 if の条件には time_index < n を加えてあげて、方向転換を全てしきった後、 time_index == n の状態では time_index < n によって false を返すようにし、t_now.to_s == time_lr[time_index][0] での判定を行わないようにする
  # 仮に、 t_now.to_s == time_lr[time_index][0] && time_index < n のように順番を逆に記述してしまうと、はじめに t_now.to_s == time_lr[time_index][0] での検証を行なってしまうことになるのでエラーが起こる
  if time_index < n && t_now.to_s == time_lr[time_index][0]
    d = time_lr[time_index][1]
    time_index += 1
    if d == "L"
      now_direction = (now_direction + 3) % 4
    else
      now_direction = (now_direction + 1) % 4
    end
  end

  if directions[now_direction] == "N"
    sy -= 1
  elsif directions[now_direction] == "E"
    sx += 1
  elsif directions[now_direction] == "S"
    sy += 1
  elsif directions[now_direction] == "W"
    sx -= 1
  end

  if sy < 0 || (h - 1) < sy || sx < 0 || (w - 1) < sx || array[sy][sx] != "."
    break
  elsif
    array[sy][sx] = "*"
  end
end

for y in 0..(h - 1)
  for x in 0..(w - 1)
    print array[y][x]
  end
  puts ""
end

# -------------------------------------------------

h, w, sy, sx, n = gets.chomp.split.map(&:to_i)

directions = ["N", "E", "S", "W"]
now_direction = 0  # 配列 directions の添字として使用する

array = []
for i in 1..h
  array.push(gets.chomp)
end

times = []
lr = []
for i in 1..n
  line = gets.chomp.split
  times << line[0].to_i
  lr << line[1]
end

array[sy][sx] = "*"

100.times do |i|
  # 配列.include?(val) で、配列が val と == で等しい要素を持つ時に真を返す
  if times.include?(i)
    # 配列.index(val) で、指定された val と == で等しい最初の要素の位置を返す
    # times と lr の要素数は全く一緒で、元々標準入力で受け取った文字列を split で分割しているので、添字が一緒の要素同士がペアということになる
    # それを踏まえて、100 回の繰り返し処理の中で times の中から、ブロック変数 i の値と等しい要素が存在するとき、その時の添字を lr にも当てはめて lr から取り出した要素が示す方向によって次に行う処理を変える
    if lr[times.index(i)] == "L"
      now_direction = (now_direction + 3) % 4
    else
      now_direction = (now_direction + 1) % 4
    end
  end
  
  if directions[now_direction] == "N"
    sy -= 1
  elsif directions[now_direction] == "E"
    sx += 1
  elsif directions[now_direction] == "S"
    sy += 1
  elsif directions[now_direction] == "W"
    sx -= 1
  end

  if sy < 0 || (h - 1) < sy || sx < 0 || (w - 1) < sx || array[sy][sx] == "#" || array[sy][sx] == "*"
    break
  elsif
    array[sy][sx] = "*"
  end
end

array.each do |row|
  puts row
end