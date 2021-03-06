# 九九を1の段から9の段まで出力してください。


# 期待する出力値
## 1, 2, 3, 4, 5, 6, 7, 8, 9
## 2, 4, 6, 8, 10, 12, 14, 16, 18
## 3, 6, 9, 12, 15, 18, 21, 24, 27
## 4, 8, 12, 16, 20, 24, 28, 32, 36
## 5, 10, 15, 20, 25, 30, 35, 40, 45
## 6, 12, 18, 24, 30, 36, 42, 48, 54
## 7, 14, 21, 28, 35, 42, 49, 56, 63
## 8, 16, 24, 32, 40, 48, 56, 64, 72
## 9, 18, 27, 36, 45, 54, 63, 72, 81

# -------------------------------------------------

# whileループを用いた場合

def multi(x, y)
  return x * y
end

i = 1

while i < 10
for num in 1..9
  print multi(i, num)
  if num < 9
    print ", "
  else
    puts ""
  end
end
i += 1
end

# -------------------------------------------------

# forループを用いた場合

def multi(x, y)
  return x * y
end

for step in 1..9
  for num in 1..9
      print multi(step, num)
      if num < 9
        print ", "
      end
  end
  puts ""
end