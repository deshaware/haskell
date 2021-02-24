Activity 2
Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

-------------------------------

> import Prelude 

> odddrop :: [a] -> [a]
> odddrop [] = []
> odddrop [x] = []
> odddrop (x:y:zs) = (y:odddrop zs)

> getkeyvalue :: (Eq k) => k -> [(k,v)] -> [v]
> getkeyvalue k           [] = []
> getkeyvalue k ((x,y):zs) 
>                | (x == k)  = (y: getkeyvalue k zs)
>                | otherwise = getkeyvalue k zs



Prelude> :l 14-Deshaware-SwapnilGhanshyam-act02.lhs 
*Main> getkeyvalue 1 [(0,"Syracuse"), (1,"University")]
["University"]
*Main> getkeyvalue 1 [(0,"Syracuse"), (1,"University"), (2, "New York"), (3, "Onondaga")]
["University"]
*Main> inp = [(0,"Syracuse"), (1,"University"), (2, "New York"), (3, "Onondaga")]
*Main> getkeyvalue 2 inp
["New York"]
*Main> getkeyvalue 3 inp
["Onondaga"]
*Main> inp2 = [("name","swapnil"),("surname","deshaware"),("education","master's in computer sciene")]
*Main> get
getChar      getContents  getLine      getkeyvalue
*Main> getkeyvalue 3 inp2

<interactive>:12:13: error:
    * No instance for (Num [Char]) arising from the literal `3'
    * In the first argument of `getkeyvalue', namely `3'
      In the expression: getkeyvalue 3 inp2
      In an equation for `it': it = getkeyvalue 3 inp2
*Main> getkeyvalue "name" inp2
["swapnil"]
*Main> getkeyvalue "education" inp2
["master's in computer sciene"]
*Main> odd   
odd      odddrop
*Main> odddrop [1..20]
[2,4,6,8,10,12,14,16,18,20]
