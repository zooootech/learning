# あなたが利用しているブラウザでは検索ワードの履歴を見ることができません。
# あなたは検索ワードの履歴を見られないのは不便だと思ったので、検索ワードの履歴を見る機能を自分でつくることにしました。
# 検索ワードの履歴とは次のようにつくられます。

# 検索ワード W が以前に入力されたことがある場合：
# 履歴中の W を削除する。
# 履歴の先頭に W を追加する。
# 検索ワード W が以前に入力されたことがない場合：
# 履歴の先頭に W を追加する。

# 検索ワード W が N 個与えられるので、N 個の検索ワードが与えられた後の履歴を表示するプログラムを書いてください。


# 入力される値
# 入力は以下のフォーマットで与えられます。

# N
# W_1
# W_2
# ...
# W_N

# 1 行目には検索ワードの数を表す整数 N が与えられます。
# 続く N 行では検索ワード W_i が与えられます。
# 続く N 行のうちの i 行目 (1 ≦ i ≦ N) には、検索ワード W_i が与えられます。
# 検索ワード W_i は小文字のアルファベット a ~ z のみからなる文字列です。
# 入力は合計 N + 1 行であり、 最終行の末尾に改行が 1 つ入ります。
# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 検索ワードを N 個入力した後の検索履歴を出力してください。
# 出力の最後に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# 1 ≦ N ≦ 100
# 各 W_i (1 ≦ i ≦ N) に対して、W_iの文字数が20を超えない。


# 入力例1
# 5
# book
# candy
# apple
# book
# candy

# 出力例1
# candy
# book
# apple

# 入力例2
# 6
# apple
# book
# information
# note
# pen
# pineapple

# 出力例2
# pineapple
# pen
# note
# information
# book
# apple


array = []
count = gets.to_i
for i in 1..count
  word = gets.chomp
  array.push(word)
end

# reverse は自身の要素を逆順に並べた新しい配列を生成して返します。 reverse! は自身を破壊的に並べ替えます。 reverse! は self を返します。
# uniq は配列から重複した要素を取り除いた新しい配列を返します。uniq! は削除を破壊的に行い、削除が行われた場合は self を、そうでなければnil を返します。
# もし uniq! を用いてしまうと要素が一つのときに nil を返してしまうので今回は使用しない。
puts array.reverse!.uniq