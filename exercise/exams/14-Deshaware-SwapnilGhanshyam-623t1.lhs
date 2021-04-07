
CIS 623 Spring 2021 Test 1 

version       (A)

Last name:  Deshaware
First name: Swapnil Ghanshyam

SU-email: sdeshawa@syr.edu

Acknowledgement:

By submitting this file (my answers to test 1), 
I acknowledge that I accept the terms as stated in the rules section 
of the examination document.

Note:


----------------------------------------------------------------------
PUT YOUR ANSWERS TO THIS TEST IN THE SPACE PROVIDED BELOW. 
----------------------------------------------------------------------

Question 1  (20 point)

a)

> insertLast2 :: a -> [a] -> [a]
> insertLast2 a [] = []
> insertLast2 a [x] = [a,x]
> insertLast2 a (x:xs) = x:insertLast2 a xs

b) 
Feijen's Notation for insertLast2 1 [2,0]

insertLast2 1 [2,0] = 
= { applying insertLast2 }
2 : [ insertLast2 1 [0]]
= { applying insertLast2 }
2 : [ [1,0]]
[2, 1, 0]

---------------------------------------------------
-- End of Question 1
---------------------------------------------------

Question 2  (20 point)

> factors   :: Int -> [Int]
> factors n =  [x | x <- [1..n], n `mod` x == 0] 

> isprime   :: Int -> Bool
> isprime n = (n > 1) && (factors n == [1,n])

> gbc :: Int -> [(Int, Int)]
> gbc a 
>   | odd a || a <= 4 = []
>   | otherwise = results
>      where
>           primes a =  [x | x <- [1..a], isprime x]
>           results = [(i,j) | i <- primes a, j <- primes a, (i + j) == a ]


---------------------------------------------------
-- End of Question 2
---------------------------------------------------

Question 3  (20 point)

part :: [Int] -[(Int, Int)]
part [] = []
part (xs) = helper (length xs) xs
  where
  helper n xs 
     | n >= 0 = ([]) 
     | otherwise  = [
         
> part :: [Int] -> [([Int],[Int])]
> part zs = help (length zs) zs
>    where 
>        help :: Int -> [Int] -> [([Int],[Int])]
>        help n zs 
>            | n > 1 = ([x | (idx,x) <- zip [1..] zs, idx < n],[x | (idx,x) <- zip [1..] zs, idx >= n]):help (n-1) zs
>            | otherwise = []

---------------------------------------------------
-- End of Question 3
---------------------------------------------------

Question 4  (20 point)


> firstpos :: (Eq a) => (a -> a) -> (a -> a) -> [a] -> Int
> firstpos f g xs =  [ i |(x,i) <-zip  xs [0..], f x /= g x] !! 0

This function returns the elements for which it satisfy the condition return the position 



---------------------------------------------------
-- End of Question 4
---------------------------------------------------

Question 5  (20 point)

> insert :: (Ord a) => a -> [a] -> [a]
> insert x []       = [x]
> insert x (y:ys)  
>     | x >= y      = x:y:ys
>     | otherwise   = y: insert x ys

> rsort :: (Ord a)  => [a] -> [a]
> rsort []          = []
> rsort (x:xs)      = insert x (rsort xs)


---------------------------------------------------
-- End of Question 5
---------------------------------------------------


----------------------------------------------------------------------
END OF TEST. DO NOT PUT YOUR ANSWERS TO THIS TEST IN THE SPACE BELOW. 
----------------------------------------------------------------------