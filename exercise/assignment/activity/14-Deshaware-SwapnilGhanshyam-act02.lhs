Activity 02
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------

> import Prelude 

1. In the lecture, we discussed what the two functions supposed to do. For each of the two functions,
specify, in precise terms, what it does.

Answers:
(a) The function dropodd takes a list of type polymorphic and returns a list of the same type. 
The job of the dropodd function is to remove the odd indexed items from the list.
This happens through recursion.
The base case is to stop recursion when it reaches without any item in the list, it returns an empty list
The line adddrop [x] should also return an empty list, if there's only single item pending in the list, without this condition, the function would throw an exception - Non-exhaustive patterns in function dropodd

In last command, the function dropodd is defined in terms of itself, hence it is a recursion. We enumerate the list into (x:y:zs), where x and y are first and second elements and zs contains remaining elements.
Each iteration, it reduces the list by two element, it ignores the odd-indexed elements, and again calls the same function in a list with even indexed element and remaining elements zs 

Demonstration as below:
*Main> dropodd [1]
[]
*Main> dropodd [1..20]
[2,4,6,8,10,12,14,16,18,20]
*Main> dropodd [5,6,7,3,5,2]        
[6,3,2]

The recursion flow for [1..10] is illustrated below:
dropodd (1:2:[3..10])
= (2:dropodd [3..10])
= (2: dropodd (3:4:[5..10]))
= (2:4: dropodd (5:6:[7..10]))
= (2:4:6: dropodd (7:8:[9,10]))
= (2:4:6:8: dropodd (9:10:[]]))
= (2:4:6:8:10 dropodd ([]]))
= [2:4:6:8:10]

(b) The function getkeyvalue takes 2 arguments, one is a list of tuple of arity two, which has key-value pair and other is an arbitrary value, both are of polymorphic type
The first argument is the key which will be looked up into the second argument of first element of the tuple. The type of the key and the value which we will look up has to match. Otherwise it will always return an empty list
The base case is written to stop the recursion, which is to stop looking for key-value in an empty list, that will return an empty list. 
The last command shows how recursion is worked out.  We enumerate the list into ((x,y):zs), where x and y are first and second elements of a tuple and zs contains remaining elements. 
It matches the k input with x, if they are exactly the same, it will add the value in thr final result list and call the getkeyvalue function for the remaining tuples
If it doesn't fine the match, it will skip the current value in the tuple and recursively call the remaining tuples

Demonstration as below:
Prelude> :l 14-Deshaware-SwapnilGhanshyam-act02.lhs 
*Main> getkeyvalue 1 [(0,"Apple"), (1,"Orange")]
["Orange"]
*Main> getkeyvalue 1 [(0,"Apple"), (1,"Orange"), (2, "Banana"), (3, "Kiwi")]
["Orange"]
*Main> inp2 = [("name","swapnil"),("surname","deshaware"),("education","master's in computer sciene")]
*Main> getkeyvalue "name" inp2
["swapnil"]
*Main> getkeyvalue "education" inp2
["master's in computer sciene"]

2. The initial type of each of these functions are stated above. State any revisions that we need to make.
Give reasons to support your answer.
Answer:
No revision is made to the dropodd function, however we did change the type of the function getkeyvalue. The reason being, if we don't specify (Eq k) => k
, then k won't be able to match with the keys(x) from the tuples. Hence it would throw an error -> "No instance for (Eq k) arising from a use of `=='" Because we are using operator (==), we need to specify (Eq k) in order to make the comparisons. Thus we modified the definition of getkeyvalue

3. Complete the haskell definitions for the two functions and make sure that they can be loaded into GHCi
without showing any errors.
Answer:
(a)

> dropodd :: [a] -> [a]
> dropodd [] = []
> dropodd [x] = []
> dropodd (x:y:zs) = (y:dropodd zs)

(b)

> getkeyvalue :: (Eq k) => k -> [(k,v)] -> [v]
> getkeyvalue k           [] = []
> getkeyvalue k ((x,y):zs) 
>                | (x == k)  = (y: getkeyvalue k zs)
>                | otherwise = getkeyvalue k zs

