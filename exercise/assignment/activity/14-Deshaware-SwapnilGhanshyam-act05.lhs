Activity 5
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------
1. Write a mathematical definition for a sub-collection of propositional formulas.

data Prop = Const Bool 
        | Var Char 
        | Not Prop 
        | And Prop Prop
        | Imply Prop Prop

def
1. True, False is a Prop
2. If a is of type Char
    Var a is a Prop
3. If a is a Prop
    Not a is a Prop
4. If a, b are props,
    then a and b is also a Prop

1. a is an S
2. b is an S 
3. And a b is an S
4. And a ( And a b) is an S


The sub-collection of propositional formula, S, as follows:

Definition:
1. Every x ( of type Char) is a S.
2. If x is of type S, then Not X is also a S.
3. If x and y are S's, then And x y is also a S


2. Apply the usual data declarations mechanism to define/represent the sub-collection as a Haskell
datatype.

> data S = V Char | Not S | And S S
> q1 :: S
> q1 = And (V 'a') (V 'b')
> q2 = V 'z'
> q3 = And q1 ( And  ( V 'p') (And (V 'y') q1 ))
> q4 = Not q3

q1 is supposed to represent the formula 's' and 't'

3. Write a Haskell function to demonstate how to write a haskell function to manipulate these formulas.

Since we declared 3 types, we will required to write 3 cases

> noOfAnds           :: S -> Int
> noOfAnds (V a)     = 0
> noOfAnds (Not p)   = noOfAnds p 
> noOfAnds (And p q) = 1 + noOfAnds p + noOfAnds q

4. Construct four test cases to verify your implementation, demonstrating the function defined meet the
expected results.

> test1 = noOfAnds q1
> test2 = noOfAnds q2
> test3 = noOfAnds q3
> test4 = noOfAnds q4


If we execute those tests, we can get the results as following

*Main> test1
1
Explanation: The test1 is defined with a datatype S which uses the definition And x y which are characters. Thus it adds 1 and call them recursively. Since V char returns zero, both the recursion returns 0 and thus it gives 1 as expected output

*Main> test2
0
We declared q2 as V 'z' which in-turn uses second line of the definition of noOnAnds, which returns 0 and that is the expected outcome

*Main> test3
5
For this particular test, we wanted to test if we provide 4 And to check if they call them recursively and returns 5, which is an expected output

*Main> test4
5
For the final test, we used one more definition of S which is "Not x". We declared q4 as Not q3 which returns the expected outcome 5. Not that q4 is valid because it's just a 'Not S'



5. Study HR ch.1.

% Emphesis on chapter 1
% 1. Backus Nour Form
% 2. Conjective Normal Form (1.42)
% 3. HR chapter 1 section 5
%     (Examples of the sections that manipulate formulas)