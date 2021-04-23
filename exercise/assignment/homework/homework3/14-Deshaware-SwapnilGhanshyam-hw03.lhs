
Homework 3
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------


1. (8 point)
By using/modifying the Prop example from tautology.hs, implement a new data type Formula, in Haskell
to represent a general propositional formula. You implementation should be based on the following BNF
definition in the expression (1) (please see page 33 in section 1.3, Huth and Ryan) below:
φ ::= p | (¬φ) | (φ ∧ φ) | (φ ∨ φ) | (φ → φ) 

> data Formula = Var Char
>          | Not Formula
>          | And Formula Formula
>          | Imply Formula Formula
>          | Or Formula Formula
>           deriving (Show)

----------------------------------------------------------------------------------------------------------

b. (12 point)
Write a Haskell function, implfree (we will call this function implication free) of the following type:
implfree :: Formula -> Formula
• The function implfree will take a general formula in propositional logic (type Formula) as input,
return a formula (type Formula) where the resulting formula
– is equivalent to the original formula
– is free from using the logical operator -> (the implication operator)
1
Provide 2 test cases (with explanations: what are the formulas they represent and what’s the expected output)
to demonstrate that your implementation of implfree is correct.

> implfree              :: Formula -> Formula
> implfree (Var x)      =   Var x
> implfree (Not p)      =   Not (implfree p)
> implfree (And p q)    =   And (implfree p) (implfree q)
> implfree (Or p q)     = Or (implfree p) (implfree q) 
> implfree (Imply p q)  = Or (Not (implfree p))  (implfree q)


> p1 :: Formula
> p1 = Var 'a'

> p2 :: Formula
> p2 = Var 'c'

> p3 :: Formula
> p3 = Imply p1 p2

Test case1:

> test11 = implfree (Not p3)

Expected output = Not (Or (Not (Var 'a')) (Var 'c'))
Actual Output =  Not (Or (Not (Var 'a')) (Var 'c'))
Explanation:
The above test case is for the argument expression  ¬(p → q) the expected output here is ¬(¬ p ∨ q). Here p1 is Var 'a' and p2 is Var 'c' Thus when we run the code, we expect the output to be Not (Or (Not (Var 'a')) (Var 'c')). This way the function shows the input argument had implication expression, yet the output is implication free as expected

Test case2 : 

> test12 = implfree (And p1 p3)

Expected output = And (Var 'a') (Or (Not (Var 'a')) (Var 'c'))
Actual output = And (Var 'a') (Or (Not (Var 'a')) (Var 'c'))
Explanation:
The above case is for the argument (p  ∧ (p → q)) when we get the input which has implications, it returns without implications, which is (p ∧ ( ¬p ∨ q))

-----------------------------------------------------------------------------------------------------------

c. (12 point) By following pseudocode given in section 1.5, Huth and Ryan (page 62), write a Haskell
function, nnf (we will call this function negative normal form) of the following type:
nnf :: Formula -> Formula
The function nnf will take an implication free formula (type Formula) as input, return an equivalent
formula (type Formula) that contains only negation of atoms.
Provide 2 test cases (with explanations: what are the formulas they represent and what’s the expected output)
to demonstrate that your implementation of nnf is correct.

> nnf                   :: Formula -> Formula
> nnf (Var x)           =  Var x
> nnf (Not (Var x))     = Not (Var x)
> nnf (Not (Not p))     = nnf p 
> nnf (And p q)         = And (nnf p) (nnf q)
> nnf (Or p q)          = Or (nnf p) (nnf q)
> nnf (Not (And p q))   = Or (nnf (Not p)) (nnf (Not q))
> nnf (Not (Or p q))    = And (nnf (Not p)) (nnf (Not q)) 

> p4 :: Formula
> p4 = And (Var 'c') (Or (Var 'c') (Var 'd'))

> p5 = Or (Var 'd') (Var 'e')


Test Case 1: 

> test21 = nnf (Not p4)

Expected Output: Or (Not (Var 'c')) (And (Not (Var 'c')) (Not (Var 'd')))
Actual Output: Or (Not (Var 'c')) (And (Not (Var 'c')) (Not (Var 'd')))
Explanation:
The test case for Negation Normal Form is   ¬( p ∧ ( p ∨ q ))  where p is Var 'c' and q is Var 'd'. The output of this argument is (¬p ∨ ( ¬p ∧ ¬q)) . Thus we get the actual output as the expected one


Test Case 2:

> test22 = nnf (Not p5)

Expected Output: And (Not (Var 'd')) (Not (Var 'e'))
Actual Output: And (Not (Var 'd')) (Not (Var 'e'))
Explanation:
The second case for negation normal form takes ¬(p ∨ q) as argument where p is Var 'd' and q is Var 'e'. Thus when we apply negation normal form, we get the expected output is ( ¬p ∧ ¬q ))


------------------------------------------------------------------------------------------------------------


d. (18 point)
By following pseudocode given in section 1.5, Huth and Ryan (page 60-61), write a Haskell function, cnf (we
will call this function conjunctive normal form) of the following type:
cnf :: Formula -> Formula
The function cnf will take an implication free formula (type Formula) in negative normal form as input,
return an equivalent formula (type Formula) that is in conjunctive normal form. You may implement the
function DISTR as a separate helper function to support your implementation.
Provide 2 test cases (with explanations: what are the formulas they represent and what’s the expected output)
to demonstrate that your implementation of cnf is correct.

> distr               :: Formula -> Formula -> Formula
> distr (And p1 p2) q = And (distr p1 q) (distr p2 q)
> distr p (And q1 q2) = And (distr p q1) (distr p q2)
> distr p q           = Or p q

> cnf               :: Formula -> Formula 
> cnf (Var x)       = Var x
> cnf (Not (Var x)) = Not (Var x)
> cnf (And p q)     = And (cnf p) (cnf q)
> cnf (Or p q)      = distr (cnf p) (cnf q)
> cnf p             = p


Test Case 1:

> test31 = cnf (Or (And (Var 'a') (Var 'b')) (Var 'a'))

Expected Output: And (Or (Var 'a') (Var 'a')) (Or (Var 'b') (Var 'a'))
Actual Output: And (Or (Var 'a') (Var 'a')) (Or (Var 'b') (Var 'a'))
Explanation:
The first test case of conjunctive normal form takes input argument as (p ∨ ( p ∧ q)) where p is Var 'a' and q is Var 'b'. Thus we get the expected and the actual output as the same which is (( p ∨ p) ∧ ( p ∧ q)). Here because of the Or, we are making use of the helper function which applies distributivity laws.


Test Case 2:

> p6 = And (Var 'a') (Var 'b')
> p7 = And (Var 'a') (Var 'b') 

> test32 = cnf (Or p6 p7 )

Expected Output: And (And (Or (Var 'a') (Var 'a')) (Or (Var 'a') (Var 'b'))) (And (Or (Var 'b') (Var 'a')) (Or (Var 'b') (Var 'b')))

Actual Output: And (And (Or (Var 'a') (Var 'a')) (Or (Var 'a') (Var 'b'))) (And (Or (Var 'b') (Var 'a')) (Or (Var 'b') (Var 'b')))

Explanation:
The second test for cunjunctive normal form takes input argument as '(( p ∧ q) ∨ ( p ∧ q))' where Var 'a' is p and Var 'b' is q. It alsoapplies distributivity law because of the command Or. Thus we get the expected output as ((( p ∨ p) ∧ ( p ∨ q)) ∧ (( q ∨ p) ∧ ( q ∨ q)))

