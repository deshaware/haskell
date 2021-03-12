twice     :: (a -> a) -> a -> a
twice f x = f (f x)


-- *Main> map (\x -> x + 2) [1,2,3,4,5]
-- [3,4,5,6,7]

-- *Main> filter (>3)  [1,2,3,4,5]
-- [4,5]

-- filter (\x,y -> x =)

-- filter p 