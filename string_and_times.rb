# 家の前では毎週日曜日に工事が行われます。この先 N 週間、工事が日曜日の何時に始まり、どれくらいの時間続くのかは分かっています。
# 工事が N 週間続くとして、各週日曜日の工事が始まる時刻と、工事が何時間何分続くのかに関する情報が与えられるので、工事が終わる時刻を 00:00 から 23:59 までの 24 時間表記で出力してください（ここで「工事が終わる時刻」とは、工事が h 時間 m 分続くとした場合、工事が始まった時刻の h 時間 m 分後を指します）。


# 入力される値
## 入力は以下のフォーマットで与えられます。

## N
## t_1 h_1 m_1
## ...
## t_N h_N m_N

## 1 行目には工事が続く週の数を表す正整数 N が与えられ、 2 行目から (N + 1) 行目には工事が始まる時刻と、工事がどれくらい続くのかについての情報が、 "t_i h_i m_i" という形式で与えられます（1 ≤ i ≤ N）。これは時刻 t_i に工事が始まり、 h_i 時間 m_i 分工事が続くことを意味しています。t_i, h_i, m_i は各行において半角スペース区切りで与えられます。

## t_i は 24 時間表記で時刻を表す文字列で、 "AB:XY" という形をしており、これは AB 時 XY 分を表します。ただし、今回は 00:00 から 23:59 までの 24 時間表記を採用し、時・分を表す数字が 1 桁の場合には十の位を 0 で埋めます。

## 入力値最終行の末尾に改行が１つ入ります。
## 文字列は標準入力から渡されます。


# 期待する出力
## 入力された通りの順番で、各週の工事が終わる時刻を N 行出力してください。時刻の表記は入力と同じフォーマットに従うものとし、 24 時以降は翌日の時刻を記し、 00:00 から 23:59 までの間に収まるように、また、時や分を表す数字が1桁の場合には十の位を 0 で埋めてください。たとえば 24 時は 00:00、 27 時は 03:00 となります。
## 末尾に改行を入れ、余計な文字、空行を含んではいけません。


# 条件
## すべてのテストケースにおいて、以下の条件をみたします。

## ・ 1 ≤ N ≤ 50
## ・ 0 ≤ h_i ≤ 23
## ・ 0 ≤ m_i ≤ 59


# 入力例1
## 1
## 13:00 1 30

# 出力例1
## 14:30

# 入力例2
## 2
## 15:59 0 1
## 23:20 1 0

# 出力例2
## 16:00
## 00:20


week_count = gets.to_i

for i in 1..week_count
    times = gets.chomp.split
    start_time = times[0]
    hour = times[1].to_i
    minite = times[2].to_i
    
    start_time_hour = start_time.slice(0, 2).to_i
    start_time_minite = start_time.slice(3, 2).to_i
    
    result_hour = start_time_hour + hour
    result_minite = start_time_minite + minite
    
    # 先に何分になるかを確認し、60以上であれば時にプラス1をすることがポイント
    if result_minite >= 60
        result_minite = (result_minite - 60).abs
        result_hour += 1
    end
    
    if result_hour >= 24
        result_hour = (result_hour - 24).abs
    end
    
    str_result_hour = result_hour.to_s
    str_result_minite = result_minite.to_s
    
    if result_hour >= 0 && result_hour <= 9  # もしくは、str_result_hour.length == 1
        str_result_hour = "0#{result_hour}"
    end
    
    if result_minite >= 0 && result_minite <= 9  # もしくは、str_result_minite.length == 1
        str_result_minite = "0#{result_minite}"
    end
    
    puts "#{str_result_hour}:#{str_result_minite}"
        
end

