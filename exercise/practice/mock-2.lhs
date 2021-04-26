

This is prelim

> allFold :: (a -> Bool) -> [a] -> Bool
> allFold f = foldr ((&&) . f) True

> allRec :: (a -> Bool) -> [a] -> Bool
> allRec f [] = True
> allRec f (x:xs) = f x && allRec f xs 

2 

Correct 1

> sumSquares :: Int -> Int 
> sumSquares n = foldr (+) 0 (map (^2) [1..n])

Correct 2

> sumSquares3 :: Int -> Int 
> sumSquares3 n = foldr ((+) . (^2)) 0 [1..n]

> sumSquares2 :: Int -> Int 
> sumSquares2 n = sum [ x ^ 2 | x <- [1..n] ]


% > type ans a = ( a -> a)

> composeList :: [(a -> a)] -> (a -> a)
> composeList [] f = f
> composeList (x:xs) f = x  ( composeList xs f )

> composeListF :: [(a -> a)] -> (a -> a)
> composeListF = foldr(.) id


> total :: (Int -> Int) -> (Int -> Int)
> total f = \n -> sum (map f [0..n])

> totalMy :: (Int -> Int) -> (Int -> Int)
> totalMy f n= sum (map f [1..n])


> data Name = Short String | Fullname String String | Show Name

> title :: Name -> String
> title (Fullname x y) = "Esteemed" ++ x ++ y
> title (Short x) =  x


> data Prop = Const Bool | Var Char
>           | Not Prop
>           | And Prop Prop
>           | Or Prop Prop
>           | Imply Prop Prop
>           deriving (Show)

p and q = not(not p or not q)

> transform :: Prop -> Prop
> transform (Not p) = p
> transform (Or p q) = Or (transform p) (transform q)
> transform (And p q) = Not (Or (Not p) (Not q))

> q1 = Var 'S'
> q2 = Var 'T'

> q3 = Or q1 q2

> q4 = Const True

> q5 = Not q4

> test = transform (And q1 q2)

Shape

> data Shape = Circle Float | Rect Float Float deriving (Show)

> s1 = Circle 1.0

> s2 = Rect 2.0 3.0



> enlarge :: Float -> [Shape] -> [Shape]
> enlarge x [] = []
> enlarge x (Circle r:xs) = Circle (r * x): enlarge x xs
> enlarge x (Rect l w:xs) = Rect (l*x) (w*x) : enlarge x xs

> test2 = enlarge 2.0 [s2,s1]


