
CIS 623 Spring 2021 Test 2

version       (A)

Last name:  Deshaware
First name: Swapnil Ghanshyam

SU-email: sdeshawa@syr.edu

Acknowledgement:

By submitting this file (my answers to test 1), 
I acknowledge that I accept the terms as stated in the rules section 
of the examination document.

Note:


----------------------------------------------------------------------
PUT YOUR ANSWERS TO THIS TEST IN THE SPACE PROVIDED BELOW. 
----------------------------------------------------------------------


Question 1 (Total: 20 point)

a. (15 point)

> fixedpt :: Eq a => (a -> a) -> a -> a
> fixedpt fun n | fun n == n = n | otherwise = fixedpt fun (fun n)





b. (5 point)

> safetail    :: [a] -> [a]
> safetail []     = []
> safetail (x:xs) = xs

Fejen's notation

         fixedpt safetail [1..3]
    = { applying list function }
         fixedpt safetail [1,2,3]
    = { applying safetail }
         fixedpt safetail 1 : [2,3]
    = { applying safetail }
        [2,3]


-- End of Question 1
---------------------------------------------------

Question 2 (Total: 20 point)

a. (10 point)

> applyfuns :: [a -> b] -> a -> [b]
> applyfuns [] x = []
> applyfuns (f:fss) x = f x : applyfuns fss x 




b. (10 point)

> applyfunsb :: [a -> b] -> a -> [b]
> applyfunsb fss x = map (\ fu -> fu x) fss

-- End of Question 2
---------------------------------------------------

Question 3 (Total: 20 point)

> data Shapes = Circle Float | Rect Float Float | Tri Float Float Float
>               deriving  Show

a.

> dropcircle :: [Shapes] -> [Shapes]
> dropcircle [] = []
> dropcircle ((Circle r):xs) = dropcircle xs
> dropcircle ((Rect l w):xs) = (Rect l w): dropcircle xs
> dropcircle ((Tri a b c):xs) = (Tri a b c): dropcircle xs




b.


> selectcircle :: [Shapes] -> [Shapes]
> selectcircle [] = []
> selectcircle ((Circle r):xs) = (Circle r):selectcircle xs
> selectcircle ((Rect l w):xs) = selectcircle xs
> selectcircle ((Tri a b c):xs) =  selectcircle xs




-- End of Question 3
---------------------------------------------------

Question 4 (Total: 20 point)


> data LIT = Var Char | NVar Char
>          deriving Show

> type DJS = [LIT]
> type CNF = [DJS]

> type Subst     = Assoc Char Bool
> type Assoc k v = [(k,v)]

> find     :: Eq k => k -> Assoc k v -> v
> find k t = head [ v | (k',v) <- t, k == k']

> eg :: CNF
> eg = [[Var 'a'], [NVar 'b']]


a.

φ1 = (p ∨ ¬q) ∧ (¬p ∨ ¬q) and φ2 = (p ∨ q) ∧ (¬p ∨ q)


phi1 :: CNF
phi1 = [[DJS [Var 'p'] [NVar 'q']], [DJS [NVar 'p'] [NVar 'q']]]

phi2 :: CNF
phi2 = [[DJS [Var 'p'] [Var 'q']], [DJS [NVar 'p'] [Var 'q']]]

b.



evalcnf :: Subst -> CNF -> Bool
evalcnf (s:sx) fun = fun find s && evalcnf sx fun





-- End of Question 4
--------------------------------------------------- 