
Homework 5
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------


Problems (The recursion operator fold)
True. (Total: 30 point) Use the Universal property of fold as a proof principle
a. (True0 point) State the universal property of fold, and, in your own words, explain how to use it to
verify if a function g can be written as fold f v.
b. (20 point) It has been proven in (H) that the following function equality holds:
(+1) . sum = fold (+) 1 (1)
By following the ideas given in the proof of the above equality (see section 3.1, pages 358-359 in
(H)) as a guideline, present a proof for the following equality:
(3∗) . product = fold (∗) 3 (2)

> 

Solution(1a):

The universal property of fold has its origins in recursion theory. It can be stated as the following equivalence between two definitions for a function g that processes lists. 

g [] = v
g (x:xs) = f x (g xs)

The two commands shown above can be written as 

g = fold f v   

It states that for finite lists the function fold f v is not just a solution to its defining equations but indeed a unique solution. The universal property of fold was designed to handle both finite and infinte lists. 

Solution(1b):

To prove
(3∗) . product = fold (∗) 3

Proof:

To prove the above equation, we will observe if the RHS  
g = fold f v  

of universal property of fold, with
g = (3*).product
f = (*)
and v = 3

Hence by appealing to the universal property, we conclude that the equation to be proved is equivalent to the following two equations

((3*). product) []      = 3
((3*). product) (x:xs)  = (*) x (((3*) . product) xs)

Let us simplify the above equation, so we get

product [] * 3      = 3
product (x:xs) * 3  = x * (product xs * 3 )

This can be verified by simple calculations

First of all, Let us try to prove first equation

=>      product [] * 3
    = { Definition of product }
        1 * 3
    = { Applying Arithmetic }
        3

For second equation

=>      product (x:xs) * 3
    = { Definition of product }
        (x * product xs) * 3
    = { Applying Arithmetic }
        x * (product xs * 3)


As we can see, we have proved both the equation as they hold property of function fold. We do not need to prove by induction because it has been encapsulated in the universal property of fold, and the fact that the given function is expressed in terms of fold iteself. Hence our derived prood holds true.


----------------------------------------------------------------------------------------------------------

2. (Total 30 point) Use the Universal property of fold as a definition principle
By following the ideas given in the calculation of the definition of sum function (see section 3.3, pages
361-362 in (H)), which is:
sum = fold (+) 0 
a. (15 point) present the calculation steps that will lead to for the following definition for
and function in Haskell:
product = fold (∗) 1 
b. (15 point) present the calculation steps that will lead to for the following definition for
the and function in Haskell:
and = fold (&&) True 

Solution(2a):

The given function is 

product = fold (*) 1 

Let us use the universal property of fold as a definition principle which guides the transformation of recursive functions into definitions using fold.

Let us consider simple definition of product in terms of recursion.

product         :: [Int] -> Int 
product []      = 1
product (x:xs)  = x * product xs

Suppose that we redefine product using fold, which means we want to solve the equation 
product = fold f v, for a function f and a value v

We begin by observing that the equation matches the right-hand side of the universal property, from which we
conclude that the equation is equivalent to the following two equations:

product []      = v
product (x:xs)  = f x (product xs) 

As per first equation and definition of product, we know that the value of v = 1
And from other equation, we calculate definition of for f

=>      product (x:xs)  = f x (product xs) 
    = { Definition of product }
        x * product xs = f x (product xs)
    = { Generalising (product of xs) to y }
        x * y = f x y
    = { Functions }
        f = (*)

That is, using the universal property, we have derived that:
product = fold (*) 1



Solution(2b):

The given function is 

and = fold (&&) True

Let us use the universal property of fold as a definition principle which guides the transformation of recursive functions into definitions using fold.

Let us consider simple definition of and in terms of recursion.

and         :: [Bool] -> Bool 
and []      = True
and (x:xs)  = x (&&) and xs

Suppose that we redefine and using fold, which means we want to solve the equation 
and = fold f v, for a function f and a value v

We begin by observing that the equation matches the right-hand side of the universal property, from which we
conclude that the equation is equivalent to the following two equations:

and []      = v
and (x:xs)  = f x (and xs) 

As per first equation and definition of and, we know that the value of v = True
And from other equation, we calculate definition of for f

=>      and (x:xs)  = f x (and xs) 
    = { Definition of and }
        x && and xs = f x (and xs)
    = { Generalising (and of xs) to y }
        x && y = f x y
    = { Functions }
        f = (&&)

That is, using the universal property, we have derived that:

and = fold (&&) True

----------------------------------------------------------------------------------------------------------

3. (Total 40 point) Use the Fusion property of fold as a proof technique
By following the explanation given in Hutton’s paper (see section 3.2, pages 359-360 in (H)):
a. (5 point) State the fusion property of fold in precise terms.
b. (15 point) It was stated in Hutton’s paper that (page 360, (H)) that
(⊕ a) · fold (⊕) b = fold (⊕)(b ⊕ a) (6)
where ⊕ is an arbitrary infix associative operator.
Formulate the result defined by the equation (6) formally. Follow the suggestions given in section
3.2 and present a complete proof to the result.
c. (20 point) Use the fusion property of fold to present a proof for the following equation:
double . sum = foldr ((+) . double) 0 (7)
where, in (7) the function double is defined as
double :: Int -> Int
double x = x + x

Solution(3a):

THE FUSION PROPERTY OF FOLD

When two simple conditions are sufficient to ensure that composition of an arbitrary function and a fold can be used to give a single fold. This property is knowns as fusion property of fold. 

It is written as follows.

For given two equations 

h w = v
h (g x y) = f x (h y)

the fusion property can be stated as 

h · fold g w = fold f v

As with the universal property, the primary application of the fusion property is as a proof principle that avoids the need for inductive proofs. In fact, for many practical examples the fusion property is often preferable to the universal property.


Solution(3b):

The given equation is

(⊕ a) · fold (⊕) b = fold (⊕)(b ⊕ a)

When two simple conditions are sufficient to ensure that composition of an arbitrary function and a fold can be used to give a single fold. This property is knowns as fusion property of fold. 

Let us formulate the given equation 

((⊕ a) · fold (⊕) b) [ ] = (b ⊕ a)
((⊕ a) · fold (⊕) b) (x : xs) = (⊕) x (((⊕ a) · fold (⊕) b) xs)

On simplifying the above equations

(⊕ a) (fold ((⊕) b [ ]) = v
(⊕ a) (fold ((⊕) b (x : xs)) = (⊕) x ((⊕ a) (fold ((⊕) b xs))

Let us further simplifying further so we get the following

=>      (⊕ a) (fold (⊕) b []) = (b ⊕ a)
    = { Definition of fold }
        (⊕ a) b = (b ⊕ a)

and
=>      (⊕ a) (fold (⊕) b (x:xs)) = (⊕) x ((⊕ a) (fold (⊕) b xs))
    = { Definition of fold }
        (⊕ a) (fold (⊕) b xs)) = (⊕) x ((⊕ a) (fold (⊕) b xs))
    = { Generalising (fold (⊕) b xs) to a fresh variable y }
        (⊕ a) ((⊕) x y) = (⊕) x ((⊕ a) y)

Based on the fusion property this can be written using a single fold 

(⊕a) · fold (⊕) b = fold (⊕) (b ⊕ a)



Solution (3c):
To Prove:
double . sum = foldr ((+) . double) 0

Proof:
The fusion property of fold can be given as

h (fold g w [ ]) = v
h (fold g w (x : xs)) = f x (h (fold g w xs))

First, we replace the function sum by it's definition using fold

double. fold (+) = foldr ((+) . double) 0

where 

double      :: Int -> Int 
double x    =  x + x 


Let us start by replacing the definition of sum with it's fold property, as we know sum can be expressed in terms of fold as fold (+) 0. Thus,

double .(fold (+) 0) = foldr ((+) . double) 0

Now we apply universal property of fold, the equation now we need to prove becomes 

double . (fold (+) 0) []    = 0
double . (x:xs)             = ((+) . double) x (double. (fold (+) 0) xs)

By using the law of composition
double . (fold (+) 0) (x:xs) = (+) double x (double ((fold (+) 0) xs))
double . (fold (+) 0) (x:xs) = double x + (double ((fold (+) 0) xs))

Then we get the final simplified equation

double . (fold (+) 0) []        = 0                                   
double . (fold (+) 0) (x:xs)    = double x + (double ((fold (+) 0) xs))

We can prove the simplified equation as follows
For first equation,

LHS =>  double . (fold (+) 0) []
    = { using the law of composition }
        double (fold (+) 0) [])
    = { applying definition of sum(represented as fold (+) 0) }
        double 0 
    = { applying double }
        0 + 0
    = { applying + }
        0
    = RHS

Let us prove the second equation

LHS => double . (fold (+) 0) (x:xs)
    = { using law of compostion }
        double (fold (+) 0) (x:xs))
    = { applying definition of sum(represented as fold (+) 0 (x:xs)) } 
        double (x + (fold (+) 0) xs)
    = { applying law of aritmetic (distributivity) }
        double x + double ((fold (+) 0 ) xs)
    = RHS

Hence proved.
