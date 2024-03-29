badfloor :: Float -> Integer 
badfloor = read . takeWhile (/= '.') . show

floor1 :: Float -> Integer
floor1 x = if x < 0 
        then until (`leq` x) (subtract  1) (-1)
        else until (x `lt`) (+1) 1 - 1

leq :: Integer  -> Float -> Bool 
m `leq` x = fromInteger m <= x

lt :: Float -> Integer -> Bool
x `lt` n = x < fromInteger n

-- floor2 :: Float -> Integer 
-- floor2 = fst ( until unit (shrink x) (bound x))
--         where unit (m,n) = (m+1 == n)

type Interval = (Integer, Integer)

 
