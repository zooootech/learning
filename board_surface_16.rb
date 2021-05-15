# 時刻に伴う移動 (paizaランク A 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_mapmove_step6


# へびがマップ上を移動していきます。
# マップの行数 H と列数 W ,障害物を # で移動可能な場所を . で表した H 行 W 列のマップ S_1 ... S_H ,現在の座標 sy , sx ,方向転換の回数 N が与えられます。
# 続けて N 回の方向転換する時刻 t_1 ... t_N , 転換する向き d_1 ... d_N が与えられます。
# へびははじめ、北を向いています。
# へびは進む先のマスに自分の身体や障害物がない時に移動ができます。
# 時刻 0 から 99 までの間、へびは各時刻に次の行動を最大 100 回とります。

# ・ 方向転換を行う時刻の場合、指定の向きに方向転換したのち １ マス身体を伸ばす。そうでない時は、今向いている方向に １ マス身体を伸ばす。

# 各移動が可能である場合、各移動が終了した時の x , y 座標を出力してください。移動できない場合、"Stop" を出力して以降の移動を打ち切ってください。
# 移動可能であるということは、「今いるマスから移動先のマスまでの間の全てのマスが移動可能である かつ 移動先がマップの範囲外でない」 ということを意味します。
# なお、マスの座標系は左上端のマスの座標を ( y , x ) = ( 0 , 0 ) とし、
# 下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。

# 移動の一例をあげます。例えば次のような入力が与えられた時は図のような移動になります。

# 5 5 4 0 1
# .....  
# .....
# .#...
# .....
# .....   
# 2 R


# 入力される値
# H W sy sx N        
# S_0     
# ...     
# S_(H-1)     
# t_1 d_1     
# ...     
# t_N d_N


# ・ 1 行目には盤面の行数を表す整数 H , 盤面の列数を表す整数 W , 現在の y, x 座標を表す sy sx , 移動する回数 N が与えられます。
# ・ 続く H 行のうち i 行目 (0 ≦ i < H) には、盤面の i 行目の文字をまとめた文字列 S_i が与えられ、 S_i の j 文字目は、盤面の i 行目の j 列目に書かれている文字を表します。(0 ≦ j < W)
# ・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) には、i 回目の方向転換の時刻 t_i と向き d_i が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 最大 100 行の出力


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・ 1 ≦ H, W ≦ 20
# ・ 1 ≦ N ≦ 100
# ・ 0 ≦ sy < H , 0 ≦ sx < W
# ・ 0 ≦ t_i ≦ 99
# ・ t_i < t_(i+1)
# ・ 時刻は 0 から始まり、 99 の時の移動を終えるまでもしくは移動ができなくなるまで移動を繰り返す。
# ・ S_i は W 文字の文字列
# ・ マップ上の (sy, sx) のマスは必ず '.'
# ・ S の各文字は '.' または '#'
# ・ d_i は、 L, R のいずれかであり、それぞれ 左・右 を意味します。

# 入力例1
# 10 10 5 5 22
# ........#.
# ..........
# ..........
# ..........
# #.........
# ..........
# ..........
# ........#.
# ..........
# ..........
# 0 L
# 3 R
# 4 L
# 7 L
# 10 R
# 12 R
# 21 L
# 24 L
# 26 R
# 28 R
# 35 L
# 36 R
# 41 R
# 44 R
# 62 L
# 63 L
# 72 L
# 81 L
# 85 R
# 90 R
# 92 R
# 98 R

# 出力例1
# 5 4
# 5 3
# 5 2
# 4 2
# 4 1
# Stop

# 入力例2
# 18 16 13 12 26
# .....#...#......
# .#........#.#...
# ................
# #.......#.......
# ...........##.#.
# ......#.........
# ....#...........
# ................
# ..........#.....
# ......###.......
# ...............#
# ........#.#.....
# ................
# .#....#.........
# ...........#...#
# #.#.#...........
# ..#.............
# ................
# 1 R
# 2 R
# 7 R
# 9 L
# 30 L
# 33 R
# 34 R
# 39 R
# 40 L
# 41 L
# 45 L
# 46 L
# 51 R
# 52 R
# 53 R
# 57 L
# 61 L
# 62 R
# 63 R
# 64 R
# 70 R
# 75 R
# 83 R
# 84 R
# 93 R
# 97 R

# 出力例2
# 12 12
# 12 13
# 13 13
# 14 13
# 15 13
# 16 13
# 17 13
# 17 12
# 17 11
# Stop


h, w, sy, sx, n = gets.chomp.split.map(&:to_i)

directions = ["N", "E", "S", "W"]
now = 0  # 配列 directions の添字として使用する

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

100.times do |i|
  # 配列.include?(val) で、配列が val と == で等しい要素を持つ時に真を返す
  if times.include?(i)
    # 配列.index(val) で、指定された val と == で等しい最初の要素の位置を返す
    # times と lr の要素数は全く一緒で、元々標準入力で受け取った文字列を split で分割しているので、添字が一緒の要素同士がペアということになる
    # それを踏まえて、100 回の繰り返し処理の中で times の中から、ブロック変数 i の値と等しい要素が存在するとき、その時の添字を lr にも当てはめて lr から取り出した要素が示す方向によって次に行う処理を変える
    if lr[times.index(i)] == "L"
      now = (now + 3) % 4
    else
      now = (now + 1) % 4
    end
  end

  if directions[now] == "N"
    sy -= 1
  elsif directions[now] == "E"
    sx += 1
  elsif directions[now] == "S"
    sy += 1
  elsif directions[now] == "W"
    sx -= 1
  end

  if sy < 0 || (h - 1) < sy || sx < 0 || (w - 1) < sx || array[sy][sx] == "#"
    puts "Stop"
    break
  end

  puts "#{sy} #{sx}"
end

# -------------------------------------------------

# 配列 directions と、カウント変数 now_direction で移動方向の管理をしています。
# 配列 time_lr と、カウント変数 time_index で次回の時刻と方角を表します。
# times メソッド のブロック変数 t_now を時刻を表す変数とし、方向転換の時刻になったら方角を変え time_index += 1 とします。

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

time_index = 0

100.times do |t_now|
  if t_now.to_s == time_lr[time_index][0]
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

  if sy < 0 || (h - 1) < sy || sx < 0 || (w - 1) < sx || array[sy][sx] == "#"
    puts "Stop"
    break
  end

  puts "#{sy} #{sx}"
end