Homework 2
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------

Question 1 (30 point)
In one of our class lectures, the following haskell function were developed to show how to translate mathematical
definitions into related haskell functions:
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]
isprime :: Int -> Bool
isprime n = (n > 1) && (factors n == [1,n])
primes :: [Int]
primes = [ p | p <- [2..], isprime p]
Consider the following mathematical definitions:
Definition (square-free integers) A square-free integer (or squarefree integer) is a positive integer which is
divisible by no perfect square other than 1.
Develop a haskell function sqfree (type [Int]) which will return the list of all square free integers. Note
that, as in the primes example, the list is an unbounded/infinite list. In your answer, please include:
1. The complete implementation of the function sqfree and all the supporting functions, if used.
2. Provide a concise description to illustrate how you design the function sqfree. Please include comments
and specification for each supporting functions, if used

Answer:

A square-free number integers is a digit divisible by no perfect square than one. The logic behind the function is to find factors of the digit and once we find the factors, we can then check if it has factors which has square of a number. If it does then it's a square-free number.

> import Data.Char

> sqFactor :: Int -> [Int]
> sqFactor n = [x | x <- [2..n], n `mod` (x*x) == 0]

> isSquareFree :: Int -> Bool
> isSquareFree n = null (sqFactor n)

> sqfree :: [Int]
> sqfree = [x | x <- [1..], isSquareFree x]

Let us discuss each function in details:

The sqfree will generate list of unbounded/infinte list. For each number, we are checking if it is a square-free number. This can be done with another function isSquareFree, which tells if the number is either false or true. 

sqfree :: [Int]
sqfree = [x | x <- [1..], isSquareFree x]

The [1..] generates infinite list of integers. As per the definition, sqfree does not take any input argument and returns list of Integers denoted by [Int]

The function isSquareFree takes an integer n as argument, and returns either True or False. It takes input n  and generates integers from 1 to n



Question 2 (70 point)
A programming example on Caesar cipher is given in Hutton’s text, chapter 5. Study section 5.5 carefully,
together with the given code cipher.hs.
a. Give a one page summary on the design and implementation of the cipher given.
b. Imagine that you are asked to give a demonstration on Caesar’s cipher, using the text
description in section 5.5 and the code cipher.hs. Compose a list of demos items you will use for your
demonstration. Your demonstration should consists 5 examples. For each demo example, state clearly
• Purpose of the demo example
• A concise description of the example
• The expected outcome/results
• The reason(s) why you like to showcase this example

