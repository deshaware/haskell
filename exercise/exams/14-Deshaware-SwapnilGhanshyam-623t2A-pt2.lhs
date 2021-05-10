CIS 623 
Spring 2021

Modify from the following source for test 2 part 2

version       (A)

Last name:  Deshaware
First name: Swapnil Ghanshyam

SU-email: sdeshawa@syr.edu

Acknowledgement:

By submitting this file (my answers to test 2 part 2), 
I acknowledge that I accept the terms as stated in the rules section 
of the examination document.
_________________________________________________________

A Simple Sudoku Solver
27th September, 2007
In Chapter 05


The Sudoku game: an introduction

The game of Sudoku is played on a 9 by 9 grid, though 
other sizes are also possible. Given a matrix, such as 
that in Bird Figure 5.1 (refer as *example51* in 
section 0 below):

the idea is to fill in the empty cells (represented by 
the 0's) with the digits 1 to 9 so that for each 
row, column and 3 × 3 box contains the numbers 1 to 9.

In general there may be any number of solutions, though 
in a good Sudoku puzzle there should always be a unique 
solution.

_________________________________________________________
0. Basic data types and two examples of Sudoku puzzle:

a. Basic data types

> type Matrix a = [Row a]
> type Row a    = [a]

> type Grid     = Matrix Digit
> type Digit    = Char

> digits  :: [Digit]
> digits  =  ['1'..'9']

> blank   :: Digit -> Bool
> blank   =  (== '0')


b. Examples of sudoku puzzle

i. The Sudoku puzzle given in Figure 5.1 (Bird) and its 
   solution: 

> example51 :: Grid
> example51 = 
>     ["004005700",
>      "000009400",
>      "360000008",
>      "720060000",
>      "000402000",
>      "000080093",
>      "400000056",
>      "005300000",
>      "006100900"]

> solexample51 :: Grid
> solexample51 = 
>     ["184625739",
>      "572839461",
>      "369741528",
>      "728963145",
>      "953412687",
>      "641587293",
>      "417298356",
>      "295376814",
>      "836154972"]


ii. An alternate example of a Sudoku puzzle and its 
    solution: 

> examplealt :: Grid
> examplealt = 
>     ["020000000",
>      "000600003",
>      "074080000",
>      "000003002",
>      "080040010",
>      "600500000",
>      "000010780",
>      "500009000",
>      "000000040"]

> solexamplealt :: Grid
> solexamplealt =
>     ["126437958",
>      "895621473",
>      "374985126",
>      "457193862",
>      "983246517",
>      "612578394",
>      "269314785",
>      "548769231",
>      "731852649"]

_________________________________________________________
1. Specification

> solve1 :: Grid -> [Grid]
> solve1 = filter valid . completions

> completions :: Grid -> [Grid]
> completions = expand . choices

> type Choices = [Digit]

> choices :: Grid -> Matrix Choices
> choices = map (map choice)
>  where choice d | blank d   = digits
>                 | otherwise = [d]

> expand :: Matrix Choices -> [Grid]
> expand = cp . map cp

> cp :: [[a]] -> [[a]]
> cp []       = [[]]
> cp (xs:xss) = [x:ys | x <- xs, ys <- cp xss]

> valid  :: Grid -> Bool
> valid g = all nodups (rows g) &&
>           all nodups (cols g) &&
>           all nodups (boxs g)

> nodups       :: Eq a => [a] -> Bool
> nodups []     = True
> nodups (x:xs) = x `notElem` xs && nodups xs

> rows :: Matrix a -> [Row a]
> rows = id

> cols          :: Matrix a -> [Row a]
> cols [xs]     = [[x] | x <- xs]
> cols (xs:xss) = zipWith (:) xs (cols xss)

> boxs :: Matrix a -> [Row a]
> boxs = map ungroup . ungroup . map cols .
>        group . map group

> ungroup          = concat
> group []         = []
> group (x:y:z:xs) = [x,y,z]:group xs

_________________________________________________________
2. Pruning

> prune :: Matrix Choices -> Matrix Choices
> prune =
>  pruneBy boxs . pruneBy cols . pruneBy rows
>  where pruneBy f = f . map pruneRow . f

> pruneRow :: Row Choices -> Row Choices
> pruneRow row = map (remove ones) row
>  where ones = [d | [d] <- row]

> remove :: Choices -> Choices -> Choices
> remove xs [d] = [d]
> remove xs ds  = filter (`notElem` xs) ds


> many     :: (Eq a) => (a -> a) -> a -> a
> many f x = if x == y then x else many f y
>     where y = f x

> solve2 :: Grid -> [Grid]
> solve2 = filter valid . expand . many prune . choices

_________________________________________________________


Question 6 (Total: 20 point)
a (8 point)
Review the given source code test2-p2.lhs and bird’s text chapter 5, section 1 to section 3 carefully. Base
on the explanations given in bird’s text, in your own words, give a one page summary that:
• explain how pruning are being performed by the actions taken by the function prune (see section 2. Pruning in the file test2-p2.lhs) and the two helper functions (ie. pruneRow remove) it utilizes.
• construct code examples to help your explanations.

Solution:

There are two methods given to solve a sudoku puzzle solve1 and solve2

The solve1 methods works without prune function, which means it creates more combinations(9^61) of rows to solve the sudoku puzzle and makes it practically difficult to solve it in real time.

The solve2 functions has different approach. It makes use of prune function and thuse reduces the number of combinations of different rows by pruning the rows which removes the duplicates(the digits which are already there in other rows of that combination) and thus it makes it efficient to solve the puzzle in real time.

Let us see how pruning is being performed in the function solve2. We seek a function prune which can be defined as follows

prune :: Matrix Choices -> Matrix Choices
prune =
 pruneBy boxs . pruneBy cols . pruneBy rows
 where pruneBy f = f . map pruneRow . f

where we start pruning each row which is defined in the function pruneRow

pruneRow        :: Row [Digit] -> Row [Digit]
pruneRow row    = map (remove fixed) row
    where fixed = [d | [d] <- row]

What pruneRow function do is to remove the duplicate values if they have appeared before in a singleton entry.
For instance if the value of the row is ["1234", "563", "3", "4"], since 3 and 4 are singleton entries, then can be removed if they have appeared in other entries. So after applying pruneRow function on it, it will return ["12","56","3","4"]

The remove operation is taken care by the function `remove` which simply removes the fixed choices from any choice that is not fixed.

remove :: [Digit] -> [Digit] -> [Digit]
remove ds [x] = [x]
remove ds xs = filter (`notElem` ds) xs

where 

notElem :: (Eq a) => a -> [a] -> Bool
notElem x xs = all (/= x) xs

Remove function takes a list of Digit and checks if the digits in the second lists exists in the first half, if they don't exits, which is checked by the function `notElem`, it returns true, which in turn filters out the value in remove function.

Let us illustrate code examples

ghci> pruneRow ["1234", "563", "3", "4"]
["12","56","3","4"]

ghci> remove ['1','5'] ['1', '2', '3', '4']
"234"
ghci> remove ['2','4'] ['1', '2', '3', '4']
"13"

ghci> notElem '2' ['1', '2', '3', '4']
False
ghci> notElem '5' ['1', '2', '3', '4']
True

and example for function prune
ghci> prune ( choices  example51 )
[["1289","189","4","268","123","5","7","1236","129"],["1258","1578","1278","2678","1237","9","4","1236","125"],["3","6","1279","27","1247","147","125","12","8"],["7","2","1389","59","6","13","158","148","145"],["15689","13589","1389","4","13579","2","1568","1678","157"],["156","145","1","57","8","17","1256","9","3"],["4","13789","123789","2789","279","78","1238","5","6"],["1289","1789","5","3","2479","4678","128","12478","1247"],["28","378","6","1","2457","478","9","23478","247"]]

The remove function removes the elements from the seconds list which are present in the first list. It filters out those values with the help of the function `notElem`. pruneRow utilizes both the function to perform the job we explained before.

In this way the prune function reduces unnecessary combination which exists in the solve1 and thus improves the total number (10^27) of total combination which is way less than 9^61 combinations

-----------------------------------------------------------------------------------------------------------------
(b)The many function and the prune in the given source code are being designed to solve a 9 × 9 Sudoku puzzle.
In one to two paragraphs, explain (in your own words) why this solution is sometimes referred as using fixed
point computation with a pruning strategy.

Solution:

Why solve2 referred as using fixed-point computation with a pruning strategy?

As we have seen, there are total two functions which solves the sudoku example, solve1 and solve2. The solve2 function is much efficient than the solve1 function because it generates less number of combinations by removing the duplicate digits occured in a row. This is performed by pruneRow function. The simplest Sudoku problems are solved just by repeatedly pruning the matrix of choices until only singleton choices are left. This idea of removing duplicate values has direct impact on efficiency, and it does this by applying function till the point where it cannot return different values that the function it is applying to. In other words, it uses a function which applies recuresively until it returns the same value, which is represented by the function named `many`

The `many` function uses a strategy of keep applying the function until the function itself has no impact on the given argument. This helps us to reduce even more impossible choices that may occur as the puzzle generates more and more rows combinations. 

The definition of fixed-point function is 

For given a function f defined from a set A to A itself:
f : A → A
the fixed-point iteration method is find a value s in A (referred as a fixed point) such that f(s) = s by
applying the function f to a starting value a repeatedly

The prune function gives the efficient combinations of rows.

Thus, with the help of fixed-point function and pruning, solve2 function solves sudoku puzzle efficiently, thus solve2 solution referred as fixed-point computation with a pruning strategy.

-----------------------------------------------------------------------------------------------------------------
c (6 point)
Test the function solve2 with the two examples:
• example51
• examplealt
For each case, does the function return a solution within a reasonable among time? Give explanation(s) to
support you have observed.

Solution:

For the first example51

ghci> solve2 example51  
[["184625739","572839461","369741528","728963145","953412687","641587293","417298356","295376814","836154972"]]

Explanation:

The function solve2 for argument example51 returns the output quickly, this is due to pruning.

as for the other example, examplealt

ghci> solve2 examplealt

This will go in infinte loop and will not provide any output. 
Explanation:
As we can see, there are many 0 in the given input
