Activity 4
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------

1. Define/compose a haskell function cp to compute the Cartesian product of a list of lists (type: [[a]]).
Your answer must include the type of the function, and, the definition must use both recursion and list
comprehension with 2 generators.

> cp :: [[a]] -> [[a]]
> cp [] = [[]]
> cp (xs:xss) = [x:ys | x <- xs, ys <- yss ]
>     where yss = cp xss

2. (Optional) Use Feijen’s notation to show the working of the cp function of at least one of the following
cases:
a. cp [[0],[1],[2]]
cp [[0],[1],[2]]
= { applying cp }
(0: cp [[1,2]])
= { applying cp }
([0,1]: cp [[2]])
= { applying cp }
([0,1,2]: cp [[]])
= { applying cp }
([0,1,2]: [[]])
= { applying cp }
[[0,1,2]]

b. cp [[0,1],[1,2]]
= { applying cp }
(0: cp [[1,2]) ++ (1: cp [1,2])
= { applying cp }
([0,1] ++ (1: cp [[2]) ++ [1,1] ++ (1: cp [[2])))
= { applying cp }
[[0,1],[0,2],[1,1],[1,2]]

c. cp [[0,1,2],[],[2,3]]
= { applying cp }
([[0,1,2]: cp [[],[2,3]]])
= { applying cp }
[]

d. cp [[0,1,2],[3]]
= { applying cp }
(0: cp [3]) ++ (0: cp [3]) ++ (0: cp [3]) 
= { applying cp }
[[0,3],[1,3],[2,3]]

3. Test cases

> test1 :: [[Int]]
> test1 =  cp [[1], [2,3,4,5,6,7]]

expected -> [[1,2],[1,3],[1,4],[1,5],[1,6],[1,7]]
justification -> As xs is [1] and xss is [2,3,4,5,6,7], the function recursively calls on xss until it reaches to the base empty list, thus it creates a pair of x with each item in xss recursively. 


> test2 :: [[Char]]
> test2 = cp [['a'],['b','c','d'],[]]

expected -> []
justification -> When we run the Cartesian Product on the given set of characters, the last 2 lists inside the given argument runs recursively. As the last item is empty, there's no possible choice that returns after the call, hence all the pairs created with ['b','c','d'] would become empty


> test3 :: [[Int]]
> test3 =  cp [[1,2], [2,3]]

expected -> [[1,2],[1,3],[2,2],[2,3]]
justification -> When we apply the cp function on the two lists of lists, an item from the first list will create a pair with each item on the second list. thus x is 1, xs turns 2 and yss will be [2,3]. When the function calls recursively, it calls for 2 and 3 and returns the result for both 1 and 2. Thus the output would provide 4 items  [[1,2],[1,3],[2,2],[2,3]]


> test4 :: [[Int]]
> test4 =  cp [[],[1,2], [2,3]]

expected -> []
justification -> For test4, the first element itself is an empty list, which show's there is no possible choice that can return thus it returns an empty list
