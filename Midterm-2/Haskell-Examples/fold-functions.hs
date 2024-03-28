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
