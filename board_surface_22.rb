# 陣取りのターン数 (paizaランク B 相当)
# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_camp_step5

# このコードでは paint をキューとして使います。
# まず最初に ? にするべき距離を question に入れます。
# 次に * の座標と距離を paint に追加します。
# paint から座標と距離を取り出し、上下左右に移動出来るか確認します。
# このとき距離が question に入っているようならマスを ? に書き換え、そうでないなら * に書き換えます。
# この処理を paint の中身が空になるまでループします。

h, w, n = gets.chomp.split.map(&:to_i)

array = []
for i in 1..h
  array << gets.chomp
end

question = []  # 距離を入れる配列を生成
for i in 1..n
  question << gets.chomp.to_i
end

# このコードでは paint をキューとして使います。
paint = []

# まず最初にスタート位置の * を、配列 question に 0 が含まれている場合は ? に、含まれていない場合は * に書き換え、その後、座標と操作回数（距離のこと、スタートは 1 ）を paint に追加します。
for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "*"
      if question.include?(0)
        array[y][x] = "?"
      else
        array[y][x] = "*"
      end
      paint.push([y, x, 1])
    end
  end
end

# paint から座標と操作回数（距離）を取り出し、上下左右を確認し移動出来る場合、配列 question に n が含まれている場合は ? に、含まれていない場合は * に書き換え、移動先の座標と 1 増やした操作回数を paint に追加します。
# この処理を paint の中身が空になるまでループします。

while paint.size != 0  # 配列 paint の要素がなくなるまで繰り返し処理を行う
  # 配列.delete_at(pos)で、指定された位置 pos にある要素を取り除きそれを返します。 pos が範囲外であったら nil を返します。
  # Array#at と同様に負のインデックスで末尾から位置を指定することができます。
  # 二次元配列 paint からインデックス（添字）が 0 の要素 を取り除き、その要素（3 つの要素を持つ配列）の要素をそれぞれ x, y, n に代入する
  y, x, n = paint.delete_at(0)

  ast_or_que = "*"  # アスタリスクかクエスチョンの文字列を代入する変数を、まずアスタリスクを代入し定義する
  if question.include?(n)  # もし距離を表す要素を持つ配列 question に、その時点での距離 n が含まれている場合、変数 ast_or_que に ? を代入する
    ast_or_que = "?"
  end

  if 0 < y && array[y - 1][x] == "."
    array[y - 1][x] = ast_or_que
    paint.push([y - 1, x, n + 1])
  end
  if y < h - 1 && array[y + 1][x] == "."
    array[y + 1][x] = ast_or_que
    paint.push([y + 1, x, n + 1])
  end
  if 0 < x && array[y][x - 1] == "."
    array[y][x - 1] = ast_or_que
    paint.push([y, x - 1, n + 1])
  end
  if x < w - 1 && array[y][x + 1] == "."
    array[y][x + 1] = ast_or_que
    paint.push([y, x + 1, n + 1])
  end
end

array.each do |row|
  puts row
end

# -------------------------------------------------

h, w, n = gets.chomp.split.map(&:to_i)

array = []
for i in 1..h
  array << gets.chomp
end

distances = []
for i in 1..n
  distances << gets.chomp.to_i
end

# このコードでは my_p をキューとして使います。
my_p = []

# まず最初にスタート位置の * を、配列 distances に 0 が含まれている場合は ? に、含まれていない場合は * に書き換え、その後、座標と操作回数（距離のこと、スタートは 1 ）を my_p に追加します。
for y in 0..(h - 1)
  for x in 0..(w - 1)
    if array[y][x] == "*"
      if distances.include?(0)
        array[y][x] = "?"
      else
        array[y][x] = "*"
      end
      my_p.push([y, x, 1])
    end
  end
end

# my_p から座標と操作回数（距離）を取り出し、上下左右を確認し移動出来る場合、配列 distances に n が含まれている場合は ? に、含まれていない場合は * に書き換え、移動先の座標と 1 増やした操作回数を my_p に追加します。
# この処理を my_p の中身が空になるまでループします。

while my_p.size != 0  # 配列 my_p の要素がなくなるまで繰り返し処理を行う
  # 配列.delete_at(pos)で、指定された位置 pos にある要素を取り除きそれを返します。 pos が範囲外であったら nil を返します。
  # Array#at と同様に負のインデックスで末尾から位置を指定することができます。
  # 二次元配列 my_p からインデックス（添字）が 0 の要素 を取り除き、その要素（3 つの要素を持つ配列）の要素をそれぞれ x, y, n に代入する
  y, x, n = my_p.delete_at(0)

  if 0 < y && array[y - 1][x] == "."
    if distances.include?(n)
      array[y - 1][x] = "?"
    else
      array[y - 1][x] = "*"
    end
    my_p.push([y - 1, x, n + 1])
  end
  if y < h - 1 && array[y + 1][x] == "."
    if distances.include?(n)
      array[y + 1][x] = "?"
    else
      array[y + 1][x] = "*"
    end
    my_p.push([y + 1, x, n + 1])
  end
  if 0 < x && array[y][x - 1] == "."
    if distances.include?(n)
      array[y][x - 1] = "?"
    else
      array[y][x - 1] = "*"
    end
    my_p.push([y, x - 1, n + 1])
  end
  if x < w - 1 && array[y][x + 1] == "."
    if distances.include?(n)
      array[y][x + 1] = "?"
    else
      array[y][x + 1] = "*"
    end
    my_p.push([y, x + 1, n + 1])
  end
end

array.each do |row|
  puts row
end