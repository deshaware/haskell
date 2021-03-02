Activity 3
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------

1. In the lecture, we discussed what the two sorting methods supposed to do.
For each of the two methods, implement the function(s) that are used to build the sorting method.
Answer:

The two sorting methods that we discussed in the lectures are insertion sort and merge sort
We used 2 different ways to implement those functions, with and without an internal function, which are illustrated with the followin commands

Insertion Sort

> insert :: (Ord a) => a -> [a] -> [a]
> insert x []       = [x]
> insert x (y:ys)  
>     | x <= y      = x:y:ys
>     | otherwise   = y: insert x ys

> isort :: (Ord a)  => [a] -> [a]
> isort []          = []
> isort (x:xs)      = insert x (isort xs)

Insertion Sort with internal method

> isort1 :: (Ord a)      => [a] -> [a]
> isort1 []              = []
> isort1 (x:xs)          = insert1 x (isort1 xs)
>    where 
>       insert1 x []     = [x]
>       insert1 x (y:ys)  
>           | x <= y     = (x:y:ys)
>           | otherwise  = y:(insert x ys)


Merge Sort

> msort :: (Ord a) => [a] -> [a]
> msort []         = []
> msort [x]        = [x]
> msort xs         = merge ( msort left) (msort right)
>       where
>            left  = take ((length xs) `div` 2) xs
>            right = drop ((length xs) `div` 2) xs

> merge :: (Ord a) => [a] -> [a] -> [a]
> merge [] lst     = lst
> merge lst []     = lst
> merge (x:xs) (y:ys) 
>      | x < y     = x : (merge xs (y:ys))
>      | otherwise = y : (merge (x:xs) ys)



2.
Answer:
(a)Let's look at the first sorting method, which is insertion sort:

The function isort is an insertion sort method, which takes input as list of polymorphic type and returns the sorted output of the list argument

isort :: (Ord a)  => [a] -> [a]

As we compare the value of elements of the list, we have to write class Ord a. The Ord class is used for totally ordered datatypes.The Ordering datatype allows a single comparison to determine the precise ordering of two objects.


The way insertion sort works is like it takes the element one by one from the input list, and then it puts the element at a position where it will be in sorted order.

isort (x:xs)   = insert x (isort xs)
or
isort1 (x:xs)  = insert1 x (isort1 xs)


The insert method takes 2 argument, one is the element(x) and second is the list(xs). 

insert :: (Ord a) => a -> [a] -> [a]

It interates through the list recursively and compares each element in the list(y:ys), if the element(x) is less than or equal to the current element(y) then it appends the given element to the list, otherwise it continues the recursive call for the given element(x) with the remaining element of the list(ys)
The command is illustrated below:

insert x (y:ys)  
    | x <= y      = x:y:ys
    | otherwise   = y: insert x ys


the isort/isor1 has an condition mentioned below to stop the recursion when the list goes to empty

 isort [] = []

The only difference between isort and isort1 it uses internal function insert1 where it does not require to be declared explicitly


(b)Merge Sort

The function msort is a merge sort method, which takes input as list of polymorphic type and returns the sorted output of the list argument

 msort :: (Ord a) => [a] -> [a]

As we compare the value of elements of the list, we have to write class Ord a. The Ord class is used for totally ordered datatypes.The Ordering datatype allows a single comparison to determine the precise ordering of two objects.

The way merge sort work is it split the input list argument into two halves, left and right. It calls msort recursively on both the halves. Both the halves are generated with take and drop function wich provides the length divided by 2 

msort xs         = merge ( msort left) (msort right)
      where
           left  = take ((length xs) `div` 2) xs
           right = drop ((length xs) `div` 2) xs

Below condition is to stop the execution of recursion infinitely

msort []         = []
msort [x]        = [x]

Once the recursion stops itt returns then calls the merge method. Merge takes two list as input argument and return the sorted-merged version of both list combined into one

 merge :: (Ord a) => [a] -> [a] -> [a]

It stops recursion when either of the lists goes empty.

 merge [] lst     = lst
 merge lst []     = lst

The merge process is a recursive process, where it takes one element from both the lists ( x and y ) and compares them. If x is greater than y then it adds x to the list and call merge recursively for the remaining element of the first list(xs) and second list ( y:ys). Otherwise it adds y element since it's smaller than x and calls the merge recursively on remaining(ys) element with first list(x:xs)

Below commands demonstrates the merge process

 merge (x:xs) (y:ys) 
      | x < y     = x : (merge xs (y:ys))
      | otherwise = y : (merge (x:xs) ys)

3.
(a)
insert 3 [1, 1, 2, 3, 5, 9]

Let's illustrate the Feijen's notation

insert 3 [1, 1, 2, 3, 5, 9] = 
= { applying insert }
 1: insert 3 [1, 2, 3, 4, 5, 9]
= { applying insert }
[1, 1] : insert 3 [2, 3, 4, 5, 9]
= { applying insert }
[1, 1, 2]: insert 3 [3, 4, 5, 9]
= { applying insert }
[1, 1, 2, 3]: { [3, 3, 4, 5, 9] }
= { alist notaton }
[1, 2, 3, 3, 4, 5, 9]

(b)
isort [53, 9, 2, 6, 19] = 
= { applying isort }
insert 53 isort [9, 2, 6, 19] 
= { applying isort }
insert 53 { insert 9 isort [2, 6, 19] } 
= { applying isort }
insert 53 { insert 9 { insert 2 isort [6, 19] } } 
= { applying isort }
insert 53 { insert 9 { insert 2 { insert 6 isort [19]} } } 
= { applying isort }
insert 53 { insert 9 { insert 2 { insert 6 { insert 19 isort [] } } } } 
= { applying isort }
insert 53 { insert 9 { insert 2 { insert 6 { insert 19 [] } } } } 
= { applying insert }
insert 53 { insert 9 { insert 2 { insert 6 [19]  } } } 
= { applying insert }
insert 53 { insert 9 { insert 2 [6, 19] } } 
= { applying insert }
insert 53 { insert 9 [2, 6, 19]  } 
= { applying insert }
insert 53 [2, 6, 9, 19] }
= { applying insert }
[2, 6, 9, 19, 53] 


