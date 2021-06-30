# 連結リスト
# 連結リストとは、基本的なデータ構造の一つで、複数のデータを格納することができ、各データが一つ前あるいは後（もしくはその両方）のデータへの参照情報（リンク、ポインタ）を持っている構造のこと。

## 単方向で線形なリスト

# このクラスから生成されるインスタンスが、値（データ）と、次（および前）のデータへの参照情報（リンク、ポインタ）を属性（インスタンス変数）として持つ、 Node クラスを定義
# 連結リストの要素（節となるもの）の設計図となるクラス
class Node
  # attr_accessor(*name)はインスタンス変数 name に対する読み取りメソッド(ゲッター)と書き込みメソッド(セッター)の両方を定義します。
  # これにより、クラス外部からインスタンス変数へのアクセスが可能になります。
  # name には String または Symbol を 1 つ以上指定します。
  attr_accessor :val, :next

  # initializeメソッドは Class#new から新しく生成されたオブジェクトの初期化のために呼び出されます。他の言語のコンストラクタに相当します。デフォルトの動作ではなにもしません。
  # initialize には Class#new に与えられた引数がそのまま渡されます。
  # Node クラスのインスタンスが生成されたときに値（データ）と、次（および前）のデータへの参照情報（リンク、ポインタ）を属性として持たせるメソッド
  def initialize(val)
    # @val というインスタンス変数を初期化
    # 値（データ）を格納するインスタンス変数
    @val = val

    # @next というインスタンス変数を初期化
    # 次（および前）のノードを指している、参照（リンク、ポインタ）を格納するインスタンス変数
    @next = nil
  end
end

# 連結リストの雛形（設計図）となるクラス
class LinkedList
  attr_reader :head

  # 連結リストを生成する際に呼びだされるメソッド
  # ある値を引数として連結リストの最初の要素(Node)を生成し、それをインスタンス変数に格納する、という処理を実行する
  def initialize(val)
    @head = Node.new(val)
  end

  # 連結リストに要素を追加するためのメソッド
  def add_tail(val)
    # 連結リストの最初の要素を引数とし、 search_tailメソッドを呼び出す
    node = search_tail(@head)
    # search_tailメソッドによってリターンされた要素の @next に、次の要素の情報を代入する
    node.next = Node.new(val)
  end

private
  # 引数として Node を渡してその Node の次に Node を連結させる
  # Node を追加することだけが責務
  def append_list(obj, val)
    obj.next = Node.new(val)
  end

  # 新たに連結リストに追加する要素への参照情報（リンク）を持たせる要素を探すためのメソッド
  def search_tail(node)
    # はじめ、先頭の要素の情報(@head)を引数として受け取り、処理を実行する
    # もし先頭の要素の @next が nil の場合、先頭の要素をリターンし、既に次の要素への参照情報を持っている場合は、 search_tailメソッドを再帰的に呼び出す
    # ! は not 演算子で、式の値が真であるとき偽を、偽であるとき真を返します。
    return node if !node.next
    # 再帰呼び出しを行う際は、次の要素へのリンク(node.next)を引数に渡し、リンク先の要素を元に再帰処理を行う
    # 引数で受け取った（リンクによって指し示された）要素の、次の要素への参照情報が nil の場合、引数で受け取った要素をリターンし、既に次の要素への参照情報を持っている場合は、 search_tailメソッドを再帰的に呼び出す
    # この動作を、参照情報が nil の要素が見つかるまで行う
    search_tail(node.next)
  end
end

l = LinkedList.new(1)
# => <LinkedList:0x0000000001184240 @head=#<Node:0x00000000011841f0 @val=1, @next=nil>>

l.add_tail(2)
# => <LinkedList:0x0000000001184240 @head=#<Node:0x00000000011841f0 @val=1, @next=#<Node:0x000000000117fd08 @val=2, @next=nil>>>

l.add_tail(3)
# => <LinkedList:0x0000000001184240 @head=#<Node:0x00000000011841f0 @val=1, @next=#<Node:0x000000000117fd08 @val=2, @next=#<Node:0x000000000117ee80 @val=3, @next=nil>>>>

# -------------------------------------------------

# コメントなし

class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class LinkedList
  attr_reader :head

  def initialize(val)
    @head = Node.new(val)
  end

  def add_tail(val)
    node = search_tail(@head)
    node.next = Node.new(val)
  end

private
  def append_list(obj, val)
    obj.next = Node.new(val)
  end

  def search_tail(node)
    return node if !node.next
    search_tail(node.next)
  end
end

l = LinkedList.new(1)
l.add_tail(2)
l.add_tail(3)