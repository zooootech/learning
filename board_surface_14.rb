# マップの行数 H と列数 W ,障害物を # で移動可能な場所を . で表した H 行 W 列のマップ S_1 ... S_H ,現在の座標 sy, sx, 移動の回数 N が与えられます。
# プレイヤーははじめ北を向いています。
# 続けて、 N 回の移動の向き d_1 ... d_N と移動するマス数 l_1 ... l_N が与えられます。
# 各移動が可能である場合、移動後の y , x 座標 を出力してください。
# 移動しきれない場合、移動できるところまで移動した後の座標を出力した後に "Stop" を出力して、以降の移動を打ち切ってください。
# 移動可能であるということは、以下の図の通り
# 「今いるマスから移動先のマスまでの間の全てのマスが移動可能である かつ 移動先がマップの範囲外でない」 ということを意味します。
# なお、マスの座標系は左上端のマスの座標を ( y , x ) = ( 0 , 0 ) とし、
# 下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。


# 入力される値
# H W sy sx N        
# S_0         
# ...     
# S_(H-1)     
# d_1 l_1     
# ...     
# d_N l_N

# ・ 1 行目には盤面の行数を表す整数 H , 盤面の列数を表す整数 W , 現在の y, x 座標を表す sy sx , 移動する回数 N が与えられます。
# ・ 続く H 行のうち i 行目 (0 ≦ i < H) には、盤面の i 行目の文字をまとめた文字列 S_i が与えられ、 S_i の j 文字目は、盤面の i 行目の j 列目に書かれている文字を表します。(0 ≦ j < W)
# ・ 続く N 行のうち i 行目 (1 ≦ i ≦ N) には、i 回目の移動の向き d_i と移動するマス数 l_i が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 最大 N 行の出力
# ・ 各移動が可能である場合、移動後の y , x 座標 を出力してください。
# ・ 移動しきれない場合、移動できるところまで移動した後の座標を出力した後に "Stop" を出力して、以降の移動を打ち切ってください。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・ 1 ≦ H, W ≦ 20
# ・ 1 ≦ N ≦ 100
# ・ 0 ≦ sy < H, 0 ≦ sx < W
# ・ 1 ≦ l_i ≦ 20
# ・ S_i は W 文字の文字列
# ・ マップ上の(sy, sx)のマスは必ず.
# ・ S の各文字は '.' または '#'
# ・ d_i は、 L, R のいずれかであり、それぞれ 左・右 を意味します。


# 入力例1
# 10 10 6 4 3
# ..#.....#.
# ..........
# ##.#......
# #.##....#.
# .##.#.....
# ........#.
# .#......#.
# .#........
# ...#......
# #.#.......
# L 2
# R 1
# L 4

# 出力例1
# 6 2
# 5 2
# 5 0
# Stop

# 入力例2
# 15 15 6 4 7
# .......#.......
# ....#.......#.#
# .......#.....#.
# .......#.#...#.
# #......#.......
# #.........#....
# ..............#
# ..#...#....#..#
# ............#..
# ..#...##......#
# ##..#..#.#.....
# #..............
# ............#..
# ...#...........
# .#.........#.#.
# L 4
# L 3
# R 4
# R 5
# L 3
# L 2
# R 1

# 出力例2
# 6 0
# 9 0
# 9 0
# Stop

# -------------------------------------------------

# 移動が可能かどうかの各条件は次のような処理に言い換えられます。 「移動先が障害物でない」→ map[移動後のy座標][移動後のx座標]!='#' 「移動先がマップの範囲外でない」 → 0<=移動後のy座標 && 移動後のy座標<H && 0<=移動後のx座標 && 移動後のx座標<W
# 複数のマスの移動あっても、1マスずつ進めながら移動できるかを判定します。
# 移動途中で移動が不可能になった場合には移動を打ち切ります。
# 移動が完了できた場合は最終的な移動後のマスを出力して現在の位置を更新します。

h, w, sy, sx, n = gets.chomp.split.map(&:to_i)

directions = ["N", "E", "S", "W"]
now_direction = 0  # 配列 directions の添字として使用する

array = []
for i in 1..h
  array.push(gets.chomp)
end

for i in 1..n
  d, l = gets.chomp.split
  l = l.to_i

  if d  == "L"
    now_direction = (now_direction + 3) % 4
  else
    now_direction = (now_direction + 1) % 4
  end

  flag = false
  l.times do
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
      flag = true
      if directions[now_direction] == "N"
        sy += 1
      elsif directions[now_direction] == "E"
        sx -= 1
      elsif directions[now_direction] == "S"
        sy -= 1
      elsif directions[now_direction] == "W"
        sx += 1
      end
    end
  end

  puts "#{sy} #{sx}"
  if flag
    puts "Stop"
    break
  end
end

# -------------------------------------------------

h, w, sy, sx, n = gets.chomp.split.map(&:to_i)

directions = ["N", "E", "S", "W"]
now_direction = 0  # 配列 directions の添字として使用する

array = []
for i in 1..h
  array.push(gets.chomp)
end

for i in 1..n
  d, l = gets.chomp.split
  l = l.to_i
  is_break = false

  if d  == "L"
    now_directions = (now_direction + 3) % 4
  else
    now_directions = (now_direction + 1) % 4
  end

  l.times do
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
      if directions[now_direction] == "N"
        sy += 1
      elsif directions[now_direction] == "E"
        sx -= 1
      elsif directions[now_direction] == "S"
        sy -= 1
      elsif directions[now_direction] == "W"
        sx += 1
      end
      puts "#{sy} #{sx}"
      puts "Stop"
      is_break = true
      break
    end
  end

  break if is_break

  puts "#{sy} #{sx}"
end