# 座標系での規則的な移動
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_move_step4


# 開始時点の x , y 座標と移動の歩数 N が与えられます。
# 以下の図のように時計回りに渦を巻くように移動を N 歩行った後の x , y 座標 を答えてください。
# なお、マスの座標系は下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。


# 入力される値
# X Y N

# ・ 1 行で、開始時点の x , y 座標を表す X , Y ,移動の歩数 N が与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 1行での出力
# ・ 移動を N 歩行った後の x , y 座標を出力してください。

# x y


# 条件
# すべてのテストケースにおいて、以下の条件を満たします。
# ・ -100 ≦ X, Y ≦ 100
# ・ 0 ≦ N ≦ 100


# 入力例1
# 0 0 3

# 出力例1
# 0 1

# 入力例2
# 38 47 27

# 出力例2
# 41 47

# -------------------------------------------------

# 「歩いた歩数 steps が 深さ d - 1 のとき角に達する」という規則性を読み取ることが重要

x, y, n = gets.chomp.split.map { |i| i.to_i }

# 歩数を初期化
steps = 0
# 合計歩数を予め 2 歩進めておく
total_steps = 2

# 初回の深さ
depth = 3

# 角に達した回数を予め 1 にしておく
corner_count = 1

if n == 1
  x += 1
elsif n == 2
  x += 1
  y += 1
  # この時点で最初の角に達していることになる
else
  x += 1
  y += 1
  # 最初の角に達している状態から繰り返し処理をスタート
  while true
    # 一歩進む
    steps += 1
    # 合計歩数も 1 増える
    total_steps += 1
    # 右上から右下のラインを移動する場合
    if corner_count == 0
      y += 1
    # 右下から左下のラインを移動する場合
    elsif corner_count == 1
      x -= 1
    # 左下から左上のラインを移動する場合
    elsif corner_count == 2
      y -= 1
    # 左上から右上のラインを移動する場合
    elsif corner_count == 3
      x += 1
    end

    # 歩いた歩数が、(深さ - 1)のとき角に達する
    if steps == (depth - 1)
      # 角に達する度に corner_count を +1 する
      # corner_count の値が増えると、進む方向が変わる仕様で、それが x もしくは y の値の増減に作用することになる
      corner_count += 1
      # 歩数をリセット
      steps = 0
      # もし corner_count が 4 に達した場合
      if corner_count == 4
        # その時点での合計歩数 total_steps が、与えられた歩数 n に達した場合、処理を抜ける
        if total_steps == n
          break
        else
          # 4 つ目の角（右上の角）に達した際、次の深度に移行させるため、マニュアルで x に +1 をし、右に移動させる
          x += 1
          # x に +1 をしたので、歩数を 1 進める
          steps = 1
          # 歩数を 1 進めたので、合計歩数も 1 進める
          total_steps += 1
          # 次の移動が下向き (y += 1) の動きになるよう corner_count をリセットする
          corner_count = 0
          # 次の深度に移行するので、深さ depth に +2 をする
          depth += 2
        end
      end
    end

    # その時点での合計歩数 total_steps が、与えられた歩数 n に達した場合、処理を抜ける
    if total_steps == n
      break
    end
  end
end

puts "#{x} #{y}"