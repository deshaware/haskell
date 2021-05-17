
CIS 623 Spring 2021 Test 3

Last name:  Deshaware
First name: Swapnil Ghanshyam

SU-email: sdeshawa@syr.edu

Acknowledgement:

By submitting this file (my answers to test 3), 
I acknowledge that I accept the terms as stated in the rules section 
of the examination document.

> import Prelude hiding (scanr)

Problems
1. (10 point) Base on the description given in section 6.6 (bird), in your own words (1 paragraph), give a
precise specifcation of the maximum segment sum problem in English.

Solution:

The maximum sum problem is a famous one, it's history is described in J Bentley's Programming Pearls. 
For the given sequence of integers, it is required to calculate the maximum sum of the segement, where segment is nothing but a continous subsequence. 
For instance,

[1,2,5,2,-7,-3,6,8,-12]

has a maximum sum 14. of the segment [6,8]. on the other hand, the sequence [-7, -3] has a maximum segment of sum of zero since the empty sequence is a segment of each list and its sum is zero. We can say that the maximum segment sum will always be non negative or it can either be a zero or a positive value



---------------------------------------------------------------------------------------------------------------
2. (15 point) State the formal specification to the MSS problem (the mss function given) and provide the
definitions of all the functions used.

Solution:

So the maximum segment sum problem can be defined as a sum of all the segments obtained from the given sequence of integers.

The formal specification of MSS function can be given as:

> mss :: [Int] -> Int 
> mss = maximum . map sum . segments

The function takes an argument as a list of integers and returns a maximum sum of all the segements that it calculates. It uses helper functions such as segments, map sum and maximum to perform this operation.

> segments :: [a] -> [[a]]
> segments = concat . map inits. tails

The segments function also has a set of helper functions.
The segments functions returns a list of all the posible segments from the given input argument. 

> tails :: [a] -> [[a]]
> tails [] = [[]]
> tails (x : xs) = (x : xs) : tails xs

> inits :: [a] -> [[a]]
> inits [] = [[]]
> inits (x:xs) = [] : map (x:) (inits xs)

The tails functions is function that takes an argument as a list and returns the list of initial segments. So what it does is returning all the tail segments of the given argument. It describes the process of taking all the initial segments of all the tail segments.

segments "abcd"
["","a","ab","abc",""abcd,"","b","bc","bcd","","c","cd","","d",""]

As we can see, we get empty sequences for every tail segments

Consider the following example for the given functions:

ghci> mss [1,2,5,2,-7,-3,6,8,-12]
14

Let's see how all the internal function works for this given example

ghci> segments [1,2,5,2,-7,-3,6,8,-12]
[[],[1],[1,2],[1,2,5],[1,2,5,2],[1,2,5,2,-7],[1,2,5,2,-7,-3],[1,2,5,2,-7,-3,6],[1,2,5,2,-7,-3,6,8],[1,2,5,2,-7,-3,6,8,-12],[],[2],[2,5],[2,5,2],[2,5,2,-7],[2,5,2,-7,-3],[2,5,2,-7,-3,6],[2,5,2,-7,-3,6,8],[2,5,2,-7,-3,6,8,-12],[],[5],[5,2],[5,2,-7],[5,2,-7,-3],[5,2,-7,-3,6],[5,2,-7,-3,6,8],[5,2,-7,-3,6,8,-12],[],[2],[2,-7],[2,-7,-3],[2,-7,-3,6],[2,-7,-3,6,8],[2,-7,-3,6,8,-12],[],[-7],[-7,-3],[-7,-3,6],[-7,-3,6,8],[-7,-3,6,8,-12],[],[-3],[-3,6],[-3,6,8],[-3,6,8,-12],[],[6],[6,8],[6,8,-12],[],[8],[8,-12],[],[-12],[]]

So let's see how helper functions of segment works

ghci>  tails [1,2,5,2,-7,-3,6,8,-12]
[[1,2,5,2,-7,-3,6,8,-12],[2,5,2,-7,-3,6,8,-12],[5,2,-7,-3,6,8,-12],[2,-7,-3,6,8,-12],[-7,-3,6,8,-12],[-3,6,8,-12],[6,8,-12],[8,-12],[-12],[]]

ghci>  map inits [[1,2,5,2,-7,-3,6,8,-12],[2,5,2,-7,-3,6,8,-12],[5,2,-7,-3,6,8,-12],[2,-7,-3,6,8,-12],[-7,-3,6,8,-12],[-3,6,8,-12],[6,8,-12],[8,-12],[-12],[]]

[[[],[1],[1,2],[1,2,5],[1,2,5,2],[1,2,5,2,-7],[1,2,5,2,-7,-3],[1,2,5,2,-7,-3,6],[1,2,5,2,-7,-3,6,8],[1,2,5,2,-7,-3,6,8,-12]],[[],[2],[2,5],[2,5,2],[2,5,2,-7],[2,5,2,-7,-3],[2,5,2,-7,-3,6],[2,5,2,-7,-3,6,8],[2,5,2,-7,-3,6,8,-12]],[[],[5],[5,2],[5,2,-7],[5,2,-7,-3],[5,2,-7,-3,6],[5,2,-7,-3,6,8],[5,2,-7,-3,6,8,-12]],[[],[2],[2,-7],[2,-7,-3],[2,-7,-3,6],[2,-7,-3,6,8],[2,-7,-3,6,8,-12]],[[],[-7],[-7,-3],[-7,-3,6],[-7,-3,6,8],[-7,-3,6,8,-12]],[[],[-3],[-3,6],[-3,6,8],[-3,6,8,-12]],[[],[6],[6,8],[6,8,-12]],[[],[8],[8,-12]],[[],[-12]],[[]]]

ghci> concat [[[],[1],[1,2],[1,2,5],[1,2,5,2],[1,2,5,2,-7],[1,2,5,2,-7,-3],[1,2,5,2,-7,-3,6],[1,2,5,2,-7,-3,6,8],[1,2,5,2,-7,-3,6,8,-12]],[[],[2],[2,5],[2,5,2],[2,5,2,-7],[2,5,2,-7,-3],[2,5,2,-7,-3,6],[2,5,2,-7,-3,6,8],[2,5,2,-7,-3,6,8,-12]],[[],[5],[5,2],[5,2,-7],[5,2,-7,-3],[5,2,-7,-3,6],[5,2,-7,-3,6,8],[5,2,-7,-3,6,8,-12]],[[],[2],[2,-7],[2,-7,-3],[2,-7,-3,6],[2,-7,-3,6,8],[2,-7,-3,6,8,-12]],[[],[-7],[-7,-3],[-7,-3,6],[-7,-3,6,8],[-7,-3,6,8,-12]],[[],[-3],[-3,6],[-3,6,8],[-3,6,8,-12]],[[],[6],[6,8],[6,8,-12]],[[],[8],[8,-12]],[[],[-12]],[[]]]

[[],[1],[1,2],[1,2,5],[1,2,5,2],[1,2,5,2,-7],[1,2,5,2,-7,-3],[1,2,5,2,-7,-3,6],[1,2,5,2,-7,-3,6,8],[1,2,5,2,-7,-3,6,8,-12],[],[2],[2,5],[2,5,2],[2,5,2,-7],[2,5,2,-7,-3],[2,5,2,-7,-3,6],[2,5,2,-7,-3,6,8],[2,5,2,-7,-3,6,8,-12],[],[5],[5,2],[5,2,-7],[5,2,-7,-3],[5,2,-7,-3,6],[5,2,-7,-3,6,8],[5,2,-7,-3,6,8,-12],[],[2],[2,-7],[2,-7,-3],[2,-7,-3,6],[2,-7,-3,6,8],[2,-7,-3,6,8,-12],[],[-7],[-7,-3],[-7,-3,6],[-7,-3,6,8],[-7,-3,6,8,-12],[],[-3],[-3,6],[-3,6,8],[-3,6,8,-12],[],[6],[6,8],[6,8,-12],[],[8],[8,-12],[],[-12],[]]

ghci> map sum [[],[1],[1,2],[1,2,5],[1,2,5,2],[1,2,5,2,-7],[1,2,5,2,-7,-3],[1,2,5,2,-7,-3,6],[1,2,5,2,-7,-3,6,8],[1,2,5,2,-7,-3,6,8,-12],[],[2],[2,5],[2,5,2],[2,5,2,-7],[2,5,2,-7,-3],[2,5,2,-7,-3,6],[2,5,2,-7,-3,6,8],[2,5,2,-7,-3,6,8,-12],[],[5],[5,2],[5,2,-7],[5,2,-7,-3],[5,2,-7,-3,6],[5,2,-7,-3,6,8],[5,2,-7,-3,6,8,-12],[],[2],[2,-7],[2,-7,-3],[2,-7,-3,6],[2,-7,-3,6,8],[2,-7,-3,6,8,-12],[],[-7],[-7,-3],[-7,-3,6],[-7,-3,6,8],[-7,-3,6,8,-12],[],[-3],[-3,6],[-3,6,8],[-3,6,8,-12],[],[6],[6,8],[6,8,-12],[],[8],[8,-12],[],[-12],[]]

[0,1,3,8,10,3,0,6,14,2,0,2,7,9,2,-1,5,13,1,0,5,7,0,-3,3,11,-1,0,2,-5,-8,-2,6,-6,0,-7,-10,-4,4,-8,0,-3,3,11,-1,0,6,14,2,0,8,-4,0,-12,0]

ghci> maximum [0,1,3,8,10,3,0,6,14,2,0,2,7,9,2,-1,5,13,1,0,5,7,0,-3,3,11,-1,0,2,-5,-8,-2,6,-6,0,-7,-10,-4,4,-8,0,-3,3,11,-1,0,6,14,2,0,8,-4,0,-12,0]
14

which is our maximum sum

---------------------------------------------------------------------------------------------------------------
3. (30) point total) In page 129 (bird), a quadratic time solution to the MSS problem is derived, using
formal methods.
• (5 point) State the solution obtained as a function named mss1, providing its type and definition
in Haskell.
Solution:

We can defined an efficient solution for MSS problem as follows:

mss1 :: [Int] -> Int
mss1 = maximum . map sum . segments1

segments1 :: [Int] -> Int
segments1 = maximum . map ( maximum . scanl (+) 0) . tails

As we have seen the previous definition of mss, the number of steps involved will be around n^3 for the list of size n. There are approximately n^2 segments and summing them will make it to n^3 steps. 

That's why mss1 is an efficient and alternate way to calculate maximum segments sum which reduces the the running time from O(n^3) to O(n^2)


• (25 point) Outline the steps carried out (according to bird’s text) to obtain this improved solution.
Discuss, in your own words, the formal method(s) used to obtain the solution, according to the
outline your stated. Your overall answer to this question (i.e. question 3) should be able one to
two pages long. Do not go beyond two pages.
Solution:

We have seen that the direct evaluation of maximum segment sum problem (MSS) required n^3 steps for a list of length n. That is n^2 segments approximately and calculating the sum of each segments will take n steps, so total evaluation of mss require n^3 steps.

We start with the definition of the segment, it is given as follows:

segments = maximum . map sum . concat . map inits . tails

Considering the formal we fina a low that can be applied, which will give us:
map f . concat = concat . map (map f)

It applies to the subterm map sum . concat which provides:
maximum . conact . map (map sum) . map inits . tails

Next, we can apply the law

map f . map g = map (f . g)

in order to get the following:

maximum . concat . map ( map sum . inits ) . tails

We can also apply one law which is:
maximum . concat = maximum . map maximum 

As we can see, the above law can be made use because both inits and tails returns non-empty lists. This further leads to

maximum . map ( maximum . map sum . inits) . tails

We can make use of the property of scanl defined as
map sum . inits = scanl (+) 0 

which leads to the following command:

maximum . map( maximum . scanl (+) 0) . tails

Therefore the improved version of maximum sum segments, which can be given as the function mss1 is:

mss1 :: [Int] -> Int 
mss1 = maximum . map sum . segments

with segments defined as:

segments = maximum . map ( maximum . scanl (+) 0 ) . tails

The mss1 is an improvement in running time from n^3 to n^2


---------------------------------------------------------------------------------------------------------------
4. (40 point total) In page 130 (bird), a linear time solution to the MSS problem is derived, using formal
methods.
• (5 point) State the solution obtained as a function named mss2, providing its type and definition in
Haskell.
Solution:

The above stated function mss1 which runs in O(n^2).
We can further reduce the time to obtain a more efficient function. This efficient function runs in a linear-time. It is defined as function mss2.

It is defined as follows:

mss2    :: [Int] -> Int
mss2    = maximum . scanr (@) 0 
        where x@y = 0 `max` (x + y)



• (5 point) Give an algebraic expression for the computation scanr (+) 0 [x1, x2, ..., xn].
Solution:

The definition of scanr is as follows

> scanr :: (a -> b -> b) -> b -> [a] -> [b]
> scanr f e []     = [e]
> scanr f e (x:xs) = f x (head ys):ys
>		where ys = scanr f e xs

So the algebric expression for computation of scanr can be given as:

scanr (+) 0 [x1,x2,...,xn] = 
    scanr (+) [x1,x2...] : (0 + xn) : 0 =
    .
    .
    .
    [(x1 + (x2 + (... ( xn + 0)))), (x2 + (... ( xn + 0))), ..., (xn+0), 0]

For instance, we can give algebric expression in terms of example 

ghci> scanr (+) 0 [1,2,3,4] 
[10,9,7,4,0]

 scnar (+) 0 [1,2,3,4] 
     = scanr (+) [1,2,3] : (0 + 4) : 0
     = scanr (+) [1,2] : (3 + 4) : 4 : 0 
     = scanr (+) [1] : (7 + 2) : 7 : 4 : 0
     = [1 + 9] : 9 : 7 : 4 : 0
     = [10, 9, 7, 4, 0]



• (30 point) Outline the steps carried out (according to bird’s text) to obtain this improved solution
from mss1 you give in your answers to question 3. Discuss, in your own words, the formal method(s)
used to obtain the solution, according to the outline your stated. Your overall answer to this question
(i.e. question 3) should be able one to two pages long. Do not go beyond three pages.

Solution:

We can get a function that runs in a linear time as we have seen other functions mss and mss1 which runs in (n^3) and (n^2) running time. 
From mss1, we take into consideration 

maximum . scanl (+) 0

We see what we can prove about: 
foldr1 max . scanl (+) 0.

This resembles the fusion rule. We now check whether the scanl (+) 0 can be expressed as a folder.

For instance
scanl (+) 0 [x,y,z]
= [0, 0+x, (0+x)+y, ((0+x)+y)+z]
= [0, x, x+y, x+y+z]
= 0: map (x+) [0, y, y+z]
= 0: map (x+) (scanl (+) 0 [y,z])

As we can see, the calculation stated above makes use of the associativity of (+) and the fact that 0 is the identity element of (+). 
It also suggests that:

scanl (@) e     = foldr f [e]
where f x xs    = e: map (x@) xs 

The above command holds true, if provided that (@) is associative with identiy e.

Let us consider a condition which:

foldr1 (<>) . foldr f [e]   = foldr h b
            where f x xs    = e:map (x@) xs

We can observe that the function foldr1 (<>) is strict and foldr1 (<>) [e] = e,
therefore we have b = else
We still need to check the third provision of the fusion rule, we need h to satisfy:

foldr1 (<>) (e:map (x@) xs) = hx (foldr1 (<>) xs) for all x and xs

The LHS of the above equation can be simplified as:
e <> (foldr1 (<>) (map (x@) xs))

Considering the singleton case xs = [y], we find that:

h x y = e <> (x @ y)

This provides us with the definition of h. We further need to check that,
foldr1 (<>) (e:map (x@) xs) = e <> (x @ foldr1 (<>) xs)

Let us simplify this

foldr1 (<>) . map (x@) = (x@) . foldr1 (<>)

The final equation holds provided (@) distributed over (<>), that is,
x @ (y <> z) = (x @ y) <> (x @ z)

On simplification of the above equation, we see that:
maximum . map (foldr (@) 0) . tails 
    where x@y = 0 `max` (x + y)

The above simplification resembles an instance of the scal rule, except that instead of a function 'foldl', we have a 'foldr' and we also have 'tails' and not an 'inits'.
The calculation similar to scanl would provide that:

map (foldr f e) . tails = scanr f e
    where
        scanr :: (a -> b -> b) -> b -> [a] -> [b]
        scanr f e []        = [e]
        scanr f e (x:xs)    = f x (head ys) : ys
            where 
                        ys  = scnar f e xs

Finally we can conclude and say,

mss2        = maximum . scanr (@) 0
where x @ y = 0 `max` (x + y)

This function will be running in linear time for the maximum segment sum problem.
--------------------------------------------------------------------------------

