Activity 1
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------

1. The types of functions are:

fst :: (a, b) -> a

snd :: (a, b) -> b

reverse :: [a] -> [a]



2. Specification of these types of functions are:

fst : The fst function is a library function which selects the first component of the pair of tuple.
It only works with tuples of arity two. For instance, fst (1,2) would return 1

snd : The snd function is a library function which selects the second component of the pair of tuple.
It only works with tuples of arity two. For instance, snd ('x','y') would return 'y'

reverse : The reverse is a library function which takes a list of any type and returns the value in reverse order. 
It only takes list as input and not a tuple. 
For instance, 
a) reverse [10,20,30,40] returns [40,30,20,10]
b) reverse [True, False] returns [False, True]



3. Version of a reverse funtion without using built-in library function

> import Prelude hiding(reverse)

> transfer :: ([a], [a]) -> ([a], [a])
> transfer ([], ys) = ([], ys)
> transfer ((x:xs), ys) = transfer (xs, (x:ys))
> reverse :: [a] -> [a]
> reverse [] = []
> reverse xs = snd ( transfer (xs, []))

Explanation:

We turned of the implicit use of the library function "reverse" by the following command, which avoids conflict with our reverse function
    import Prelude hiding(reverse)

The reverse function is declared, which takes an argument of any type of list and returns a reverse of the list.
    reverse :: [a] -> [a]

We have a base case declared which returns an empty list
    reverse [] = []

The transfer function takes an argument as tuple of arity two, with both the components are of type list. It is declared as
    transfer :: ([a], [a]) -> ([a], [a])

The way transfer function works is we pop(remove the top) value out of the first list and we prepend (push) it to the list
    transfer ( (x:xs), ys) = transfer ( xs, (x:ys))
where 
    x  = the top element of the first list
    xs = remaining elements from the first list
    ys = remaining elements from the second list

Note that the transfer function works like a stack here

The execution starts with transfer (xs, []) with xs being an input argument of reverse function.

The working of the transfer function can be illustrated with an example argument [1,2,3]:
    transfer ([1,2,3], []) returns ([2,3], [1]) then
    transfer ([2,3], [1]) returns ([3], [2,1]), which in turns calls 
    transfer ([3], [2,1]) returns ([], [3,2,1])

After when it reaches to its base case where the first list reaches to an empty list, it returns the pair of tuple from the transfer function
     transfer ([], ys) = ([], ys)

The snd library function returns the second list of the tuple, which is the reverse of the input list
    snd ( transfer (xs, []))
For example
    snd ([], [3,2,1]) will return [3,2,1]

which is our final answer

Execution:
Prelude>reverse [1,2,3]
[3,2,1]
Prelude>reverse [True, False]
[False,True]