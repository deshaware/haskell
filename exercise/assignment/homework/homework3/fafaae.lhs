
Homework 3
Student No: 
Last Name: 
First Name: 

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
>            deriving Show


> p1 :: Formula
> p1 = And (Var 'A') (Not (Var 'A'))

> p2 :: Formula
> p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')

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

> implfree :: Formula -> Formula
> implfree (Var x)      =   Var x
> implfree (Not p)      =   Not (implfree p)
> implfree (And p q)    =   And (implfree p) (implfree q)
> implfree (Or p q)     = Or (implfree p) (implfree q) 
> implfree (Imply p q)  = Or (Not (implfree p))  (implfree q)

> test11 = And p1 p2

> test12 = Imply p1 p2


c. (12 point) By following pseudocode given in section 1.5, Huth and Ryan (page 62), write a Haskell
function, nnf (we will call this function negative normal form) of the following type:
nnf :: Formula -> Formula
The function nnf will take an implication free formula (type Formula) as input, return an equivalent
formula (type Formula) that contains only negation of atoms.
Provide 2 test cases (with explanations: what are the formulas they represent and what’s the expected output)
to demonstrate that your implementation of nnf is correct.

> nnf :: Formula -> Formula

% > nnf (Const b)       = Const b
% > nnf (Not (Const b)) = (Const (not b)) 

> nnf (Var x)       =  Var x
> nnf (Not (Var x)) = Not (Var x)
> nnf (Not (Not p)) = nnf p 
> nnf (And p q)     = And (nnf p) (nnf q)
> nnf (Or p q)        = Or (nnf p) (nnf q)
> nnf (Not (And p q)) = Or (nnf (Not p)) (nnf (Not q))
> nnf (Not (Or p q)) = And (nnf (Not p)) (nnf (Not q)) 


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
> distr (And p1 p2) q = (And (distr p1 q) (distr p2 q))
> distr p (And q1 q2) = (And (distr p q1) (distr p q2))
> distr p q           = (Or p q)

> cnf :: Formula -> Formula 

% > cnf (Const b) = (Const b) 

> cnf (Var x)       = Var x
> cnf (Not (Var x)) = Not (Var x)
> cnf (And p q)     = And (cnf p) (cnf q)
> cnf (Or p q)      = distr (cnf p) (cnf q)
> cnf p             = p

