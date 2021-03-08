# カウンター魔法を得意とする A 君は、同じくカウンター魔法を使うモンスターと戦っています。バトルはターン制で、 A 君が先攻で、A 君とモンスターで交互に魔法を使い合います。
# A 君の魔法は 1 回目と 2 回目に使うときにはダメージ 1 ですが、 3 回目以降の n 回目には、(モンスターから受けた (n - 1) 回目の攻撃のダメージ) + (モンスターから受けた (n - 2) 回目の攻撃のダメージ) のダメージを与えます。
# モンスターの魔法はこれよりも強力で、 1 回目と 2 回目には同じくダメージ 1 ですが、 3 回目以降の n 回目には、 ( A 君から受けた (n - 1) 回目の攻撃のダメージ) * 2 + ( A 君から受けた (n - 2) 回目の攻撃のダメージ) のダメージを与えます。
# A 君は自分がどれくらいモンスターの攻撃を耐えられるか知りたいと思っています。 A 君の体力を H として、両者が同じ魔法を使い続けたとき、モンスターの何回目の攻撃で A 君の体力が 0 以下になるかを出力してください。


# 入力される値
## 入力は以下のフォーマットで与えられます。

## H

## 1 行目にパイザ君の体力を表す整数 H が与えられます。

## 入力値最終行の末尾に改行が１つ入ります。
## 文字列は標準入力から渡されます。


# 期待する出力
## モンスターの何回目の攻撃でパイザ君の体力が 0 以下になるかを出力してください。
## 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
## すべてのテストケースにおいて、以下の条件をみたします。

## 3 ≤ H ≤ 10^8


# 入力例1
## 7

# 出力例1
## 4

# 入力例2
## 35

# 出力例2
## 6


hit_point = gets.to_i

a = [0, 1, 1]
b = [0, 1, 1]

damage = 2

turn = 2

while hit_point > damage
    a[0] = a[1]
    a[1] = a[2]
    b[0] = b[1]
    b[1] = b[2]

    a[2] = b[0] + b[1]
    b[2] = a[0] + a[1] * 2
    
    damage += b[2]
    
    turn += 1
end

puts turn

# -------------------------------------------------

hit_point = gets.to_i

attack_a = 0
attack_m = 0
damage_m = []
damage_a = []
turn = 0
count = 0

while hit_point > 0
  turn += 1
  if turn <= 2
    damage_m << attack_a + 1
    damage_a << attack_m + 1
    hit_point -= attack_m + 1
  else
    attack_a = damage_a[turn - 2] + damage_a[turn - 3]
    damage_m << attack_a
    attack_m = damage_m[turn - 2] * 2 + damage_m[turn - 3]
    damage_a << attack_m
    hit_point -= attack_m
  end
end

puts turn

# -------------------------------------------------

# 元々は以下のように間違えていた

hit_point = gets.to_i

attack_a = 0
attack_m = 0
damage_m = []
damage_a = []
turn = 0
count = 0

while hit_point <= 0
  turn += 1
  if turn <= 2
    damage_m << attack_a + 1
    damage_a << attack_m + 1
    hit_point -= attack_m + 1
  else
    attack_a += damage_a[turn-2] + damage_a[turn-3]  # aの攻撃力を自己代入演算子（+=）で累積している点が誤り
    damage_m << attack_a
    attack_m += (damage_m[turn-2] * 2) + damage_m[turn-3]  # mの攻撃力を自己代入演算子（+=）で累積している点が誤り
    damage_a << attack_m
    hit_point -= attack_m
  end
end

puts turn