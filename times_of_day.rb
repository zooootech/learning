# 時刻を表す長さが 5 の文字列 S が “XX:XX” の形式で与えられます。与えられた時刻の 30 分後の時刻を同じ形式で出力してください。

# 入力される値
## 1 行目に文字列 S が与えられます。
## S は “XX:XX” という形をしており、 ":" の左側は時を、右側は分を表します。時や分が一桁である場合、十の位は 0 で埋められます。また、 00:00 から 23:59 までの 24 時間表記を採用しています。
## 入力値最終行の末尾に改行が１つ入ります。
## 文字列は標準入力から渡されます。

# 期待する出力
## 与えられた時刻の 30 分後の時刻を "XX:XX" の形式で出力してください。
## 末尾に改行を入れ、余計な文字、空行を含んではいけません。

# 条件
## すべてのテストケースにおいて、以下の条件をみたします。
## S が表す時刻は最も遅くて 23:29

# 入力例1
## 01:02

# 出力例1
## 01:32

# 入力例2
## 12:31

# 出力例2
## 13:01

time = gets.chomp
hour = time.slice(0, 2)
minite = time.slice(3, 2)
int_hour = hour.to_i
int_min = minite.to_i

if (int_min + 30) >= 60
    if (int_hour + 1) >= 24
        if (int_min + 30) <= 69
            puts "00:0#{(60 - (int_min + 30)).abs}"
        else
            puts "00:#{(60 - (int_min + 30)).abs}"
        end
    elsif (int_hour + 1) <= 9
        if (int_min + 30) <= 69
            puts "0#{int_hour + 1}:0#{(60 - (int_min + 30)).abs}"
        else
            puts "0#{int_hour + 1}:#{(60 - (int_min + 30)).abs}"
        end
    else
        if (int_min + 30) <= 69
            puts "#{int_hour + 1}:0#{(60 - (int_min + 30)).abs}"
        else
            puts "#{int_hour + 1}:#{(60 - (int_min + 30)).abs}"
        end
    end
else
    puts "#{hour}:#{int_min + 30}"
end