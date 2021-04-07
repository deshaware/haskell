
This is some type

type Tree = (Int, [Tree])

> type Pair a = (a, a)

> type Assoc k v = [(k,v)]
> find :: Eq k => k -> Assoc k v -> v
> find k v = head [vi | (ki, vi) <- v, ki == k ]

> type Pos = (Int, Int)

> data Move = North | South | East | West

> move :: Move -> Pos -> Pos
> move North (x, y) = (x, y+1)
> move South (x, y) = (x, y-1)
> move East (x,y) = (x+1, y)
> move West (x, y) = (x - 1, y)

> moves :: [Move] -> Pos -> Pos
> moves [] p = p
> moves (x:xs) p = moves xs (move x p)