# 次のような「ユーザー」と「ユーザーに対応する血液型」を連想配列（辞書）として定義して、それらのキーと値のペアを順に出力してください。

# ユーザー	ユーザーに対応する血液型
# Kyoko	B	
# Rio	O	
# Tsubame	AB	
# KurodaSensei	A	
# NekoSensei	A	


# 入力される値
# なし


# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。


# 期待する出力
# 各ユーザーについて順に、ユーザーとユーザーに対応する血液型を半角スペース区切りで出力してください。
# 最後は改行し、余計な文字、空行を含んではいけません。


# 条件
# なし


hash = {Kyoko: "B", Rio: "O", Tsubame: "AB", KurodaSensei: "A", NekoSensei: "A"}

hash.each do |person, blood|
  puts "#{person} #{blood}"
end

# -------------------------------------------------

user2blood = {
  'Kyoko' => 'B',
  'Rio' => 'O',
  'Tsubame' => 'AB',
  'KurodaSensei' => 'A',
  'NekoSensei' => 'A'
}

user2blood.each { |user, blood| puts "#{user} #{blood}" }