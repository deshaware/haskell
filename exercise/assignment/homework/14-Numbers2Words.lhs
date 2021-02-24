1. Please fill in your student number, lastname
   and first name in the space below

Student No: 14
Last Name: Deshaware
First Name: Swapnil Ghanshyam

_______________________________________________________

Numbers into words
8th March, 2012
In Chapter 01
_______________________________________________________


> units, teens, tens :: [String]
> units = ["zero","one","two","three","four","five",
>          "six","seven","eight","nine"]
> teens = ["ten","eleven","twelve","thirteen","fourteen",
>          "fifteen","sixteen","seventeen","eighteen",
>          "nineteen"]
> tens  = ["twenty","thirty","forty","fifty","sixty",
>          "seventy","eighty","ninety"]

_______________________________________________________

Function convert1
Please add your specification as comment in the 
space below

Answer:
The function convert1 takes an Int as its input argument and returns the string. 
The function takes single digit and retuns a string representation of that number.
It uses the operator list indexing(!!) which takes two arguments, and returns the value at index which is
given by second index. It is zero index based.
for example 
         *Main> ['a','b','c','d'] !! 2
         'c'
In convert1 function, the first operand is is the list - "unit" and second is the input argument of the function.

Demonstration can be given as follows
Positive Scenario : 
         *Main> convert1 3
         "three"
Negative Scenario1 : if we pass negative integer value as second argument, it would fail and cause
         *Main> convert1 (-3)
         "*** Exception: Prelude.!!: negative index
Negative Scenario2 : if we pass the integer greater than 9, it would return an error - index too large
         *Main> convert1 10
         "*** Exception: Prelude.!!: index too large


> convert1 :: Int -> String
> convert1 n = units!!n -- returns nth element in the list units

_______________________________________________________


Function convert2
Please add your specification as comment in the 
space below
Answer:
The function below convert2 takes an argument as integer and returns a string. 
The function takes double digit integer and retuns a string representation of it
It's functionality is to take 2 digit integer number and return it in words 

This function uses 2 more functions 'digits2' and 'combine2' which does the job of returning the final result:

1. digits2: It takes an input of type integer and returns a tuple of type (Int, Int).
            It uses `divMod` operator to returns a quotient and remainder after dividing by 10, which in turns return a tuple and feed 
            the same as an argument to the next function combine2
            for instance 
                  *Main> 23 `divMod` 10
                  (2,3)
                  *Main> digits2 10
                  (1,0)

2. combine2: It takes an input of type tuple of integer (t, u) and returns a string, which is our final result
            The way it works is, it checks if the first element of the tuple,
            if t is 0 then it fetches an item from 'units' list at the position, which is in the second element of the tuple ( u )
            for example
                  *Main> combine2 (0,8)
                  "eight"
            if t is 1 then it fetches an item from 'teens' list, and does the same as mentioned above, for example
                  *Main> combine2 (2,1)
                  "twenty-one"
            if t >= 2 and u equal to 0, which means it has more than 2 digits number but 0 at the unit's place, for example
                  *Main> combine2 (2,0)
                  "twenty"
            if t >= 2 and u NOT equal to 0, it takes the value from both the lists 'tens' and 'units' and append the
            result at the with hyphen "-", for example
                  *Main> combine2 (4,5)
                  "forty-five"

Demonstration can be given as follows:
Positive Scenarios: 
      *Main> convert2 99
      "ninety-nine"
      *Main> convert2 7  
      "seven"
      *Main> convert2 30
      "thirty"

Negative Scenarios:
      *Main> convert2 343
      "*** Exception: Prelude.!!: index too large
      *Main> convert2 (-21)
      "*** Exception: 14-Numbers2Words.lhs:(64,3)-(68,52): Non-exhaustive patterns in function combine2
      *Main> convert2 "Syracuse"
      <interactive>:33:10: error: * Couldn't match expected type `Int' with actual type `[Char]'

Commands:

> convert2 :: Int -> String
> convert2 = combine2 . digits2

> digits2 :: Int -> (Int,Int)
> digits2 n = n `divMod` 10

> combine2 :: (Int,Int) -> String
> combine2 (t,u)
>    | t==0         = units!!u
>    | t==1         = teens!!u
>    | 2<=t && u==0 = tens!!(t-2)
>    | 2<=t && u/=0 = tens!!(t-2) ++ "-" ++ units!!u


_______________________________________________________

Function convert3
Please add your specification as comment 
in the space below
Answer:
The function "convert3" takes an argument as integer and returns a string. 
It can take 3 digit integer and retuns a string representation of it.
It's functionality is to take 2 digit integer number and return it in words 

This function uses 2 more functions 'digits3' and 'combine3' which does the job of returning the final result:

1. digits3: It takes an input of type integer and returns a tuple of type (Int, Int).
            It uses `divMod` operator to returns a quotient and remainder after dividing by "100", which in turns return a tuple and feed 
            the same as an argument to the next function combine3 function
            for instance
               *Main> digits3 1  
               (0,1)
               *Main> digits3 10
               (0,10)
               *Main> digits3 563 
               (5,63)

2. combine3: It takes an input of type tuple of integer (h, n) and returns a string, which is our final result
            
            if h is 0 then it fetches an item from 'units' list at the position, which is in the second element of the tuple ( u )
            It uses !! operator to fetch the item in units list at uth index position, for example
               *Main> combine3 (0,53)
               "fifty-three"
            else if n is zero then it depend upon h, it returns item from units list with " hundred" appended, for instance
               *Main> combine3 (9,0) 
               "nine hundred"
            otherwise it would perform both, fetching hunderd's place from units list and tenth and digit place by
               calling convert2 function, for example
               *Main> combine3 (5,99)
               "five hundred and ninety-nine"

Demonstration can be given as follows:
Positive Scenarios: 
      *Main> convert3 89
      "eighty-nine"
      *Main> convert3 799
      "seven hundred and ninety-nine"
      *Main> convert3 0
      "zero"

Negative Scenarios:
      *Main> convert3 1000
      "*** Exception: Prelude.!!: index too large
      *Main> convert3 (-445)
      "*** Exception: Prelude.!!: negative index
      *Main> convert3 'a'   
      <interactive>:13:10: error: * Couldn't match expected type `Int' with actual type `Char'


Commands:

> convert3 :: Int -> String
> convert3 = combine3 . digits3

> digits3 :: Int -> (Int,Int)
> digits3 n = n `divMod` 100

> combine3 :: (Int,Int) -> String
> combine3 (h,n)
>    | h==0      = convert2 n
>    | n==0      = units!!h ++ " hundred"
>    | otherwise = units!!h ++ " hundred and " ++ convert2 n

_______________________________________________________

Function convert6
Please add your specification as comment 
in the space below
Answer:
The function "convert6" takes an argument as integer and returns a string. 
This function can take upto 6 digit integer and retuns a string representation of it
It's functionality is to take 2 digit integer number and return it in words 

This function uses 3 more functions 'digits6', 'combine6' and 'link' which does the job of returning the final result:

1. digits6: It takes an input of type integer and returns a tuple of type (Int, Int).
            It uses `divMod` operator to returns a quotient and remainder after dividing by "1000", which in turns return a tuple and feed 
            the same as an argument to the next function combine6 function. 
            Note: We divide by "1000", even for a six digit integer, so that it will create an arity of 3 digit integer each
            for instance
            *Main> digits6 2345 
            (2,345)

2. combine6: It takes an input of type tuple of integer (m, n) and returns a string, which is our final result
            if m eqauls 0, it calls convert3 with argument n
            if n eqauls 0, it calls convert3 with argument m and appends " thousands"
            else it calls "convert3" for "m" and appends " thousands" and it calls link with n as argument
               and it calls "convert3" again for n
            for instance
            *Main> combine6 (2,0)
            "two thousand"
            *Main> combine6 (0,300) 
            "three hundred"
            *Main> combine6 (999,999)
            "nine hundred and ninety-nine thousand nine hundred and ninety-nine"


3. link: This function takes an integer and returns a string. It returns " and " if the input to this
         function is less than 100, otherwise it would return a blank spaces, to make the string 
         representation meaningful

4. convert: It is used to call a convert6 function, convert6 and convert can be used interchangeably 


Demonstration can be given as follows:
Positive Scenarios:
         *Main> convert6 213413 
         "two hundred and thirteen thousand four hundred and thirteen"
         *Main> convert6 213    
         "two hundred and thirteen"
         *Main> convert 999999
         "nine hundred and ninety-nine thousand nine hundred and ninety-nine"
Negative Scenarios:
         *Main> convert6 (-99999)
         "*** Exception: Prelude.!!: negative index
         *Main> convert6 (131231299999)
         "*** Exception: Prelude.!!: index too large
         *Main> convert 'p'
         <interactive>:55:9: error:* Couldn't match expected type `Int' with actual type `Char'


> convert6 :: Int -> String
> convert6 = combine6 . digits6

> digits6 :: Int -> (Int,Int)
> digits6 n = n `divMod` 1000

> combine6 :: (Int,Int) -> String
> combine6 (m,n)
>   | m==0      = convert3 n
>   | n==0      = convert3 m ++ " thousand"
>   | otherwise = convert3 m ++ " thousand" ++ link n ++
>                 convert3 n

> link :: Int -> String
> link n = if n < 100 then " and " else " "

> convert :: Int -> String
> convert = convert6


_______________________________________________________

Please add the 12 test cases in the space below


test11 :: String
...

and so on

