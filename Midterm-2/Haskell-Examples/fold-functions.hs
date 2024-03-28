-- Write a Haskell function that ... you must use one of the fold functions (in a non-trivial way)

{-
Question 1: Sum of Squares
Write a Haskell function sumOfSquares that takes a list of integers 
and returns the sum of the squares of these integers. 
You must use foldl or foldr to accumulate the sum.
-}

sumOfSquares :: [Int] -> Int
sumOfSquares [] = error "empty"
sumOfSquares xs = foldl (\acc x -> acc + (x*x)) 0 xs


{-


Question 2: Custom Maximum Function
Implement a function maximumFold that returns the maximum element 
from a list of integers. Do not use the built-in maximum function; 
instead, utilize foldl or foldr.
-}

maximumFold :: [Int] -> Int
maximumFold [] = error "empty"
maximumFold (x:xs) = foldl (\acc y -> if y > acc then y else acc) x xs

{-
Question 3: Reverse a List
Create a function reverseFold that reverses a list. 
Use foldl or foldr to implement this function.
-}

reverseFold :: [a] -> [a]
reverseFold = foldl (\acc x -> x : acc) []

{-
Question 4: Implement Map Using Fold
Define a function mapFold that mimics the 
behavior of the map function using foldr. 
The function should apply a given function to each element of a list.
-}

mapFold :: (a -> b) -> [a] -> [b]
mapFold f = foldr (\x acc -> f x : acc) []

{-
Question 5: Count True Values
Write a function countTrue that
counts the number of True values
in a list of Boolean values using 
foldl or foldr
-}

countTrue :: [Bool] -> Int
countTrue [] = error "empty"
countTrue xs = foldl(\acc y-> if y then acc + 1 else acc) 0 xs