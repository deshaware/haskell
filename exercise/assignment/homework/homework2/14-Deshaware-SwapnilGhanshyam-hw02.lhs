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

> sqFactors :: Int -> [Int]
> sqFactors n = [x | x <- [2..n], n `mod` (x*x) == 0]

> isSquareFree :: Int -> Bool
> isSquareFree n = null (sqFactors n)

> sqfree :: [Int]
> sqfree = [x | x <- [1..], isSquareFree x]

Let us discuss each function in details:

The sqfree will generate list of unbounded/infinte list. For each number, we are checking if it is a square-free number. This can be done with another function isSquareFree and sqFactors, which checks a factor is square free or not. Then it returns if it is a squareFree or not. With the help of list comprehension, we have generated list of square-free integer from 1 to infinity.

sqfree :: [Int]
sqfree = [x | x <- [1..], isSquareFree x]

The [1..] generates infinite list of integers with the help of mentioned list comprehension. As per the definition, sqfree does not take any input argument and returns list of Integers denoted by [Int]

The next function isSquareFree takes an integer n as argument, and returns either True or False. It takes input n and calls next function sqFactors. Then, whatever it returns, it checks if it is null or not. It does this via null funtion. 

isSquareFree :: Int -> Bool
isSquareFree n = null (sqFactors n)

sqFactors returns the list and here the null function checks if the length of the returned list is 0 or more, if it is zero then it tells True, otherwise False 

For instance, 
*Main> isSquareFree 10
True
*Main> isSquareFree 40
False
*Main> isSquareFree 33
True

And finally, the function sqFactors takes an integer n and returns the list of integer. These integers are nothing but the square factor. It checks this with the help of command 

n `mod` (x*x) == 0 

This means for a particular integer n, if it has a factor x, and if the the remainder of n and square of the factor x is zero, then it's a square-factor. 

sqFactors :: Int -> [Int]
sqFactors n = [x | x <- [2..n], n `mod` (x*x) == 0]

To illustrate our main function which is square free, it can be given as
*Main> sqfree
[1,2,3,5,6,7,10,11,13,14,15,17,19,21,22,23,26,29,30,31,33,34,35,37,38,39,41,42,43,46,47,51,53,55,57,58,59,61,62,65,66,67,69,70,71,73,74,77,78,79,82,83,85,86,87,89,91,93,94,95,97,101,102,103,105,106,107,109,110,111,113,114,115,118,119,122,123,127,129,130,131,133,134,137,138,139,141,142,143,145,146,149,151,154,155,157,158,159,161,163,165,166,167,170,173,174,177,178,179,181,182,183,185,186,187,190,191,193,194,195,197,199,201,202,203,205,206,209,210,211,213,214,215,217,218,219,221,222,223,226,227,229,230,231,233,235,237,238,239,241,246,247,249,251,253,254,255,257,258,259,262,263,265,266,267,269,271,273,274,277,278,281,282,283,285,286,287,290,291,293,295,298,299,301,302,303,305,307,309,310,311,313,314,317,318,319,321,322,323,326,327,329,330,331,334,335,337,339,341,345,346,347,349,353,354,355,357,358,359,362,365,366,367,370,371,373,374,377,379,381,382,383,385,386,389,390,391,393,394,395,397,398,399,401,402,403,406,407,409,410,411,413,415,417,418,419,421,422,426,427,429,430,431,433,434,435,437,438,439,442

And the list will be keep on going until we interrupt the process with keyboard. 


----------------------------------------------------------------------

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

Answer:

Let us illustrate the below code for cipher


a)
DESIGN AND IMPLEMENTATION OF CEASAR CIPHER:
The Cesar cipher is used for encoding a given string so that it won't be easy to read. A plaintext is simply replaced by a letter some fixed number of positions. For instance, if we were to encode a string with integer 3, then "a" will become "d". If we pass the negative integer, that is encode (-3) "d" would return "a". This can be design with the help of some helper functions and extensive use of the library function from Data.Char. Let's look at the design of each helper function:

let2int :: Char -> Int
let2int c = ord c - ord 'a'

let2int: This function takes a character as input argument and returns and integer value of that character. It uses library function 'ord' which returns ascii value, for instance, ord 'a' is 97. The function let2int returns a difference between the given number's ascii value and 97, which is first letter's ascii value. 

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

int2let: This functions is exactly opposite of the function let2int and it takes an integer as an argument and returns the charcter. It uses library function chr and it adds 97 in the number before calling chr. For instance chr 98 is 'b'

shift: This function helps to shift a character to the position mentioned. It takes 2 argument Int and Char and returns the shifted char. Initially it checks if the function is lower with the help of isLower. If it is in lower-case, then only it shifts the ascii value of the character by n. For instance shift 3 'A' would return 'A' but if we pass shift 3 'a', it will shift the character. Obviously, there are only 26 lower characters, thus it uses `mod` operation, in case if the shift is more than 26.
*Main> shift 33 'a'
'h'

encode: This function takes an integer input and a string on which it applies to the shift. It uses list comprehension to get each character in the string and apply shift operation

*Main> encode 5 "swapnil"
"xbfusnq"

Let us design a function that will decode the given string without a shift factor. This is implemented with a function named crack which takes a string as input and returns it's decoded format. The decode is the reverse of the encode function. Our goal is to find the shift factor, once we do, we can use encode function with negative value of the factor. But to be able to get the factor, we will make a use of frequency table and many helper functions from Data.Char library.

Let us illustrate the helper function first. 
table: This function has a list of floats. It is a crucial factor to crack any given string as this list provides usual frequency of all the 


lowers: It takes String input and return the number of lower case characters. It uses list comprehension to get check all characters one by and and it checks if they are greater than or equal to 'a' and less than or equal to 'b'. Optionally, we can also make the use of isAscii  function to determine the same 
For instance -> lowers "Swapnil Deshaware" has 14 lower characters

count: It takes two arguments, a character and a string, and it returns an integer. It tries to find if the given character exists inside a string or not. If it does, then how many of them exists

percent: It takes two integer arguments and returns a percentage of the first integer by second. It returns the float value
For instance
*Main> percent 3 20
15.000001

freqs: This function takes a string and finds the percentage frequency of a characters. For instance, if a letter 'p' appears 14.285715 percent in the stirng "swapnil". This provides list of 26 items, each items gives the information about percentage frequency of a character in a given input string. 
For instance
*Main> freqs "syracuse"
[12.5,0.0,12.5,0.0,12.5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,12.5,25.0,0.0,12.5,0.0,0.0,0.0,12.5,0.0]

chisqr: This function has a standard formula for chi-square statistics, which is used for comparing a list of observed frequency and list of expected frequency(which will see later). It's a summation of differences differences of items in the list divided by the expected list items. This function takes two lists of frequencies, observed and expected frequency. 

rotate: It takes an integer and a list of type polymorphic and it rotates the list. It uses drop and take function to drop the items from the back and append it in the front. That's how append operation works.
*Main> rotate 3 "Swapnil"
"pnilSwa"

positions: this function takes a character, which we will campare and fund the position of the character in the other argument of polymorphic type. For instance,
*Main> positions 'a' "swapnil"
[2]

crack: This is the main function who takes an input String and crack/decode the String and return the output. This function makes the use of all the functions explained above and calculate the factor. The factor decides how much the shifting required per character in the given input. It makes use of the frequency table. Also, it calculates the frquency of it's own, which can be denoted as observed frequency. It is calculated at the below command

table' = freqs xs

Once the observed frequence is known, we will calculate chi-square. For that we will rotate each key in the os and then keep performing the chisqr for 26 times. Logically, for each rotation of the list item, we will calculate the chi-square. Then we will calculate the minimum position on it and will take the largest of them. For instance,
*Main> freqs "waetrmp hiwleaevi"
[12.5,0.0,0.0,0.0,18.75,0.0,0.0,6.25,12.5,0.0,0.0,6.25,6.25,0.0,0.0,6.25,0.0,6.25,0.0,6.25,0.0,6.25,12.5,0.0,0.0,0.0]

*Main> [chisqr (rotate n table') table | n <- [0..25]]
[137.31557,2222.1797,536.7479,1626.2872,109.56179,4135.9424,2044.6844,1963.1238,731.7229,1996.4236,2195.8298,965.7676,900.33606,1385.6602,3837.5398,426.2407,750.68604,1315.8052,2303.7393,203.27434,1163.7979,2324.3152,1097.2108,1726.9523,856.59906,2181.2068]

This is chitab

if we ge the minimum od chitab, it will be 
*Main> minimum chitab
109.56179

If we try to find the position of the, it will return 4, which will be our factor
*Main> head (positions (minimum chitab) chitab)         
4

Thus, if we encode with (-4), it will give us the decoded String

*Main> encode (-4) "waetrmp hiwleaevi"
"swapnil deshaware"


b) Let us consider the following examples
1] 
*Main> test1 = encode (4) "swapnil ghanshyam deshaware"
Expected outcome -> "waetrmp klerwlceq hiwleaevi"

This is the example showcase the working of encode function. Here we shift the given string with 4. 

*Main> test1 = encode (4) "swapnil ghanshyam deshaware"
*Main> test1
"waetrmp klerwlceq hiwleaevi"

If we encode it with (-4) it will give us back the original string, which shows our example works
*Main> encode (-4) "waetrmp klerwlceq hiwleaevi"
"swapnil ghanshyam deshaware"

if we use crack function on this, then also this should work
*Main> crack "waetrmp klerwlceq hiwleaevi"
"swapnil ghanshyam deshaware"


2] 
*Main> test2 = encode (3) "THIS IS AWESOME"
Expected outcome -> "THIS IS AWESOME"

*Main> test2
"THIS IS AWESOME"

The reason for this example is to showcase that the ceaser cipher does not work for uppercase characters. If we try to crack it, it would give out the same string.

*Main> crack "THIS IS AWESOME"                  
"THIS IS AWESOME"

Strictly speaking, for all the capital letters, crack function works.

3]
*Main> test3 = encode 5 "apples"
Expected outcome -> "fuuqjx"
*Main> test3
"fuuqjx"
*Main> crack "fuuqjx"
Expected outcome -> "apple"
Actual outcome -> "peeath"

Here, for example string "apple" does not work. Meaning if we encode the string "apple" and if we try to decode the encoded value of this string, then it does not give back the original. That's the reason we took this example, to show that it does not work for some string.

4]
*Main> test4 = encode 11 "abc@syr.com"
*Main> test4
"lmn@djc.nzx"
*Main> crack "lmn@djc.nzx"
"mno@ekd.oay"

As you can see for the 4th example, we have included the special character '@' and '.'. If we observe the outcome, we can say that the encode function does not encode the special characters such as @ or . and that's the reason why we took this example

5] 
*Main> test5 = encode 3 "Syracuse University, NY, 13210"
*Main> test5
"Sbudfxvh Uqlyhuvlwb, NY, 13210"
*Main> crack "Sbudfxvh Uqlyhuvlwb"
"Syracuse University"

We took this example to demonstrate that when we use the combination of capital and small letters and numbers/
Since it fails to encode those characters, even if the rest of the characters are getting encoded, the outcome can be still predicted and hence its fair to say that cesar cipher is at disadvantage.




> let2int :: Char -> Int
> let2int c = ord c - ord 'a'

> int2let :: Int -> Char
> int2let n = chr (ord 'a' + n)

> shift :: Int -> Char -> Char
> shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
>          | otherwise = c

> encode :: Int -> String -> String
> encode n xs = [shift n x | x <- xs]

-- Frequency analysis

> table :: [Float]
> table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

> lowers :: String -> Int
> lowers xs = length [x | x <- xs, x >= 'a' && x <= 'z']

> count :: Char -> String -> Int
> count x xs = length [x' | x' <- xs, x == x']

> percent :: Int -> Int -> Float
> percent n m = (fromIntegral n / fromIntegral m) * 100

> freqs :: String -> [Float]
> freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
>           where n = lowers xs

> chisqr :: [Float] -> [Float] -> Float
> chisqr os es = sum [((o-e)^2)/e | (o,e) <- zip os es]

> rotate :: Int -> [a] -> [a]
> rotate n xs = drop n xs ++ take n xs

> positions :: Eq a => a -> [a] -> [Int]
> positions x xs = [i | (x',i) <- zip xs [0..n], x == x']
>                 where n = length xs - 1

> crack :: String -> String
> crack xs = encode (-factor) xs
>          where
>             factor = head (positions (minimum chitab) chitab)
>             chitab = [chisqr (rotate n table') table | n <- [0..25]]
>             table' = freqs xs
