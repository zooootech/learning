# ハノイの塔

def hanoi(n, from, to, via)
  if n == 1
    puts "#{from} から #{to} へ移す"
  else
    hanoi(n - 1, from, via, to)
    puts "#{from} から #{to} へ移す"
    hanoi(n - 1, via, to, from)
  end
end

hanoi(3, :A, :B, :C)

# -------------------------------------------------

# ハノイの塔
# 以下のコードは円盤の数が大きすぎるとタイムアウトになる


# 3 本の杭を格納する二次元配列 piles を定義
$piles = Array.new(3) { [] }

# 円盤の移動回数をカウントする変数を定義
$count = 0

# 円盤の枚数
n = gets.to_i

# 0 番の杭に、 n 枚の円盤を追加
# このプログラムでは、左にある要素（円盤）ほど下に位置しているとみなす
# 小さな円盤の上に大きな円盤を乗せることはできないため、 piles への追加はサイズの大きい円盤から順に行う
(1..n).reverse_each do |disk|
  $piles[0].push(disk)
end

# ハノイの塔のデータを出力するメソッド
def print_piles
  puts "----"
  puts "count: #{$count}"
  $piles.each_with_index do |pile, index|
    print "#{index}:"
    pile.each do |disk|
      print " #{disk}"
    end
    puts ""
  end
end

# 円盤を 1 枚移動するメソッド
# from が移動元の杭を表す引数で、 to が移動先の杭を表す引数
def move1(from, to)
  # 移動元の杭から 1 番上にある円盤を取り去る
  # 1 番右（末尾）にある要素が 1 番上にある円盤
  # pop は自身の末尾から要素を取り除いてそれを返します。
  disk = $piles[from].pop

  # 移動元から取り去った円盤を移動先に追加
  $piles[to].push(disk)

  # 円盤を動かすたびにカウントを 1 増やす
  $count += 1
end

def hanoi(n, from, to, work)
  return if n == 0

  hanoi(n - 1, from, work, to)
  move1(from, to)
  print_piles
  hanoi(n - 1, work, to, from)
end

hanoi(n, 0, 2, 1)

# -------------------------------------------------

# ハノイの塔
# 特定のステップの状態を表示する


# 3 本の杭を格納する二次元配列 piles を定義
$piles = Array.new(3) { [] }

# 円盤の枚数
n = 3

# 状態を出力する回数を指定する変数を定義
$target = 5

# 円盤の移動回数をカウントする変数を定義
$count = 0

# 0 番の杭に、 n 枚の円盤を追加
# このプログラムでは、左にある要素（円盤）ほど下に位置しているとみなす
# 小さな円盤の上に大きな円盤を乗せることはできないため、 piles への追加はサイズの大きい円盤から順に行う
(1..n).reverse_each do |disk|
  $piles[0].push(disk)
end

# ハノイの塔のデータを出力するメソッド
def print_piles
  puts "----"
  puts "count: #{$count}"
  $piles.each_with_index do |pile, index|
    print "#{index}:"
    pile.each do |disk|
      print " #{disk}"
    end
    puts ""
  end
end

# 円盤を 1 枚移動するメソッド
# from が移動元の杭を表す引数で、 to が移動先の杭を表す引数
def move1(from, to)
  # 移動元の杭から 1 番上にある円盤を取り去る
  # 1 番右（末尾）にある要素が 1 番上にある円盤
  # pop は自身の末尾から要素を取り除いてそれを返します。
  disk = $piles[from].pop

  # 移動元から取り去った円盤を移動先に追加
  $piles[to].push(disk)

  # 円盤を動かすたびにカウントを 1 増やす
  $count += 1

  # 円盤の移動回数が指定回数になったときの円盤の状態を出力する
  if $count == $target
    print_piles
    # exit(status = true) は Rubyプログラムの実行を終了します。status として整数が与えられた場合、その値を Ruby コマンドの終了ステータスとします。デフォルトの終了ステータスは 0(正常終了)です。
    # exit は例外 SystemExit を発生させることによってプログラムの実行を終了させます。
    exit
  end
end


# 指定した移動回数まで、まとめて円盤を移動させるメソッド
def move_part(num, from, to)
  # 移動する円盤を一時的に格納する配列
  temp = []

  # num 枚の円盤を上から順に取り出し、配列に格納
  num.times do
    disk = $piles[from].pop

    # unshift(*obj) もしくは prepend(*obj) は、指定された obj を引数の最後から順番に配列の先頭に挿入します。
    # 簡潔に言うと、配列の先頭に要素を追加します。
    temp.unshift(disk)
  end

  # 二次元配列 $piles の、添字が to の配列の末尾に temp の要素を追加する
  # self[start, length] は start 番目から length 個の要素を含む部分配列を返します。 length が負の時、start が自身の範囲を越えた時には nil を返します。
  $piles[to][$piles[to].length, 0] = temp
end


def hanoi(n, from, to, work)
  if n == 0
    return
  end

  if $count + ((2 ** n) - 1) <= $target
    # まとめて移動
    move_part(n, from, to)
    $count += ((2 ** n) - 1)
    if $count == $target
      print_piles
      exit
    end
  else
    # 再帰で移動
    hanoi(n - 1, from, work, to)
    move1(from, to)
    # print_piles
    hanoi(n - 1, work, to, from)
  end
end


# 移動回数が指定回数以上の場合、円盤の枚数を出力し、移動回数が指定回数未満の場合、 "Too Big" を表示し、プログラムを終了させる
if $target <= ((2 ** n) - 1)
  puts n
else
  puts "Too Big: #{((2 ** n) - 1)}"
  # exit の引数に 1 を指定することで、ステータス 1 のエラーを発生させ、プログラムを終了させます。
  exit(1)
end

hanoi(n, 0, 2, 1)