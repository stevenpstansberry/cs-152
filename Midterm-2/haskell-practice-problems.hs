{-
Task: Define a Haskell function allTrue that takes a predicate and a list as 
arguments. The function returns True if all the elements of the list satisfy 
the predicate and False otherwise
-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}

allTrue :: (a -> Bool) -> [a] -> Bool
allTrue p [] = True -- base case
allTrue p (x:xs) = p x && allTrue p xs -- continue calling allTrue so long as and returns true, if and returns false, return false
