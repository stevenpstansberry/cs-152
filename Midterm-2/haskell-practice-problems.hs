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

{-
Task: Define a Haskell function retrieve that takes a key and a list of tuples 
representing key value pairs. The function returns Just the first value 
corresponding to the given key. If the key does not appear in the list of 
tuples, the function returns Nothing.
Please include the type declaration for the function
-}

retrieve :: Eq k => k -> [(k,v)] -> Maybe v
retrieve _ [] = Nothing
retrieve k ((k',v'):xs) | k == k' = Just v'
                      | otherwise = retrieve k xs