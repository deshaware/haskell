
Homework 4
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------

Problems (Proofs)
1 Induction on numbers (Total: 20 point)
Let m, n be natural numbers and exp (resp. Nat) be the haskell function (resp. data type)

> data Nat          = Zero | Succ Nat

exp               :: Num a = a -> Nat -> a
exp x Zero        = 1 -- exp.1
exp x (Succ n)    = x * (exp x n) -- exp.2


By using the proof given in bird section 6.1 and the conventions it adopted as a guide, prove that
P(n): exp x (m+n) = exp x m * exp x n
for all x and for any natural numbers m and n by induction on n (NOT m.). Present your proof using
Feijen’s notation.

Answer: Proof by Induction.

Given that for all x and for any natural numbers m and n, let us prove that exp x (m + n) = exp x m * exp x natural.

To prove any expression with induction, we have to declare and prove base case and inductive hypothesis. 

For the given expression, we will apply on both lhs and rhs of the equation and will prove that they are the same.

Base Case: P(0) for n = 0
For this case, we will substitute value of n as 0 (since we are trying to prove on n, not m). Thus,
LHS = exp x ( m + 0)
By Feijen's notation
    = { 0 + m = m}
        exp x m 

RHS = exp x m * exp x 0
    = { exp 1 } 
        exp x m * 1
    = { exp x * 1 = x }
        exp x m 

Now we have shown that base case holds for the given expression, the expression should hold correct for n = n + 1 . Thus by inductive hypothesis step P(n + 1) 

LHS => exp x ( m + (n + 1))
    = { associate }
       exp x ((m + n) + 1)
    = { arithmetic }
       exp x (m + n) + 1
    = { exp. 2 }
       x * exp x (m + n)
    = { induction }
       x * (exp x m * exp x n)

RHS =>  exp x m * exp x (n + 1)
    = { exp.2 }
       exp x m * exp x n * x 
    = { associate law }
       ( exp x m * exp x n ) * x
    = { arithmetic }
        x * (exp x m * exp x n)

As we can see, since LHS is RHS for base case and inductive case, we have proved the given expression holds true.

-------------------------------------------------------------------------------------------------------------

2 Induction on lists (Total: 30 point)
Study section 16.6 in Hutton’s text. In particular, pay attention to the page 238 − 240 (upto the second
paragraph). As in the text, the reverse function is given as in (*):

reverse :: [a] -> [a] --- (*)
reverse [] = [] --- r.1
reverse (x:xs) = reverse xs ++ [x] --- r.2

In this question, we will use g to denote a guess function. In the text (chapter 16), the author’s guess is the
function reverse'.
In your own words, write a summary (based on section 16.6 on finding a more efficiency implementation of
the function reverse) by discussing the following steps shown from the text. Your summary should include
the following components:
-------------------------------------------------------------------------------------------------------------
• (5 point) Motivation
Explain that the reverse function (∗) runs in quadratic time in the worst case and hence our objective
is to have an alternative that can reverse a list with a better running time.

Answer:
The given function reverse takes list a finite list as an arugment and returns the reverse of that list. It achieves with the help of (++) operator. It takes 1 + length of the input list operations to complete the reverse task. The number of steps it involves is the sum from 1 to 1+n which is (n+1)(n+2)/2 which in turn (n^2 + 3n + 2)/2. That means it requires quadratic time in terms of the lenght of the given argument.

For instance, if we want to reverse a list of 4 items. then it will reverse as follows

=   reverse [1,2,3,4]
= { applying reverse }  
   reverse [2,3,4] ++ [1]
= { applying reverse }
   reverse [3,4] ++ [2] ++ [1]
= { applying reverse }
   reverse [4] ++ [3] ++ [2] ++ [1] 
= { applying reverse }
   reverse [] ++ [4] ++ [3] ++ [2] ++ [1]
= { applying reverse }
   [] ++ [4] ++ [3] ++ [2] ++ [1]
= { applying ++ }
   [4] ++ [3] ++ [2] ++ [1]
= { applying ++ }
   [4,3] ++ [2] ++ [1]
= { applying ++ }
   [4,3,2] ++ [1]
= { applying ++ }
   [4,3,2,1] 

As we can see, the quadratic time is not optimal, for instance if we were to reverse a list of thousands elements will takes fifty millions of reduction steps. Thus we need a better technique to make a reverse of the list in minimum possible time.

-------------------------------------------------------------------------------------------------------------
• (2 point) Guess
Define a general function g to combine the behavior of the reverse function the append operator (++).
Give a Haskell definition for this candidate function g.

Answer:
As we have seen, finding out a reverse of a list by the given function takes quadratic time to evaluate, thus we will try to make reverse of the list in best possible time. This can be done with the help of a candidate function g. 

g xs ys = reverse xs ++ ys

The idea behind this function is that it combines the behavior of both reverse and ++. Thus applying function g will give us reverse of the first list appended together with second list. 

-------------------------------------------------------------------------------------------------------------
• (3 point) Specification
Use the function g obtain previously to give a specification for a function reverse2 which will fulfill
our objective. That is, it will reverse a finite list with an improved running time.
Answer:
 
Let's create a function reverse2 which takes a list and returns a reverse of that list, although as compared with the previous reverse function, this function won't run in quadratic time. As we have seen the definition of a candidate function g, it is useful as it makes use of both (reverse and ++). Thus reverse2 can be defined

reverse2 xs = g xs []

where empty list is identity to append the result


-------------------------------------------------------------------------------------------------------------
• (3 point) Apply mathematical induction to construct an adequate Haskell definition for g
The definitions of the function g consists of two equations where the RHS are constructed/determined
in the induction proof. There can be many choices. Explain why the RHS obtained in the given proof
are accepted.
Answer:

The general haskell definition of g can be given as 
g :: [a] -> [a] -> [a]
g [] ys = ys
g (x:xs) ys = g xs (x : ys)

Also, one more defnition of g can be given as
g xs ys = reverse xs ++ ys  

While proving in the induction as proof, while solving on the equation on RHS, it gives out the value that can be either eqaul to LHS or can be simplified version of LHS.

For instance, while proving the base case and inductive case, we can see that when we solve the RHS, we can get the required equation quite easily

Case 0 -> Base Case
RHS => reverse [] ++ ys
    = { applying reverse }
      [] ++ ys
    = { applying ++ }
      ys

Case x:xs -> Inductive Case
RHS => reverse (x:xs) ys
    = { specification of reverse }
       reverse (x:xs) ++ ys
    = { applying reverse }
      ( reverse xs ++ [x] ) ++ ys
    = { associativity of ++ }
        reverse xs ++ ([x] ++ ys)
    = { induction hypothesis }
        g xs ([x] ++ ys)
    = { applying ++ }
        g xs (x : ys)    

which is the value of LHS here.

Thus we can say that RHS obtained in the given proof are accepted

-------------------------------------------------------------------------------------------------------------
• (12 point) Prove, by mathematical induction on xs, that for any finite lists xs, ys of type [a]:
g xs ys = reverse xs ++ ys  
Answer:


To prove a function by mathematical induction, we will state 4 steps as follows
 Let us state the proposition being proved
P(n): g xs ys = reverse xs ++ ys  

Now, let's identify the base case for the given expression.

For any finite list xs, we will show that the proposition holds good for empty list xs.

LHS => g [] ys
    = { specification of g }
      g [] ++ ys
    = { applying reverse }
      [] ++ ys
    = { applying ++ }
      ys

RHS => reverse [] ++ ys
    = { applying reverse }
      [] ++ ys
    = { applying ++ }
      ys

LHS and RHS are same, thus we can say that the claim holds for the given proposition for empty list
 Let's try to prove it for induction hypothesis. We will do this by specifying our inductive case for xs as (x:xs)

P(n): g (x:xs) ys = reverse (x:xs) ys

We can make the following simplifications which can help us prove the inductive step
g xs (x:ys) = g xs ++ (x:ys)
g xs ys = reverse xs ++ ys -- specification of g

LHS => g (x:xs) ys
    =  {specification of g}
      g ([x] ++ [xs]) ++ [ys]
    =  { applying g }
      g [xs] ++ (x ++ [ys])
    = { applying ++ }
      g xs (x : ys)

RHS => reverse (x:xs) ys
    = { specification of reverse }
       reverse (x:xs) ++ ys
    = { applying reverse }
      ( reverse xs ++ [x] ) ++ ys
    = { associativity of ++ }
        reverse xs ++ ([x] ++ ys)
    = { induction hypothesis }
        g xs ([x] ++ ys)
    = { applying ++ }
        g xs (x : ys)    

As we can see, the proposition holds true for x:xs as per inductive hypothesis. Thus we can claim that 

g xs ys = reverse xs ++ ys 

holds true for any finite list 


-------------------------------------------------------------------------------------------------------------
• (5 point) Explain that reverse2, which is the new version obtained, runs in linear time in the worst
case
Answer:

The reverse2 function use candidate function g

The function g can be declared as 

g :: [a] -> [a] -> [a]
g [] ys = ys
g (x:xs) ys = g xs (x : ys)

The definition of reverse2 can be given as follows:

reverse2 :: [a] -> [a]
reverse2 xs = g xs []

As the reverse2 function makes use of candidate function, which in turns makes use of ++ and reverse both, it tends to give best efficiency as compared to previous reverse function

For instance , we have:
reverse ['x','y','z']
= { applying reverse }
reverse’ ['x','y','z'] []
= { applying reverse’ }
reverse’ ['y','z'] ('x':[])
= { applying reverse’ }
reverse’ ['z'] ('y':('x':[]))
= { applying reverse’ }
reverse’ [] ('z':('y':('x':[])))
= { applying reverse’ }
'z':('y':('x':[]))

As we can see, to reverse a list of 3 items, we required n + 2 steps, which is way efficient that the previous reverse function performance where it would have taken in quadratic.

